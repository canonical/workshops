import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';

import 'api/certificate.dart';
import 'api/event.dart';
import 'api/image.dart';
import 'api/instance.dart';
import 'api/instance_state.dart';
import 'api/network.dart';
import 'api/network_acl.dart';
import 'api/operation.dart';
import 'api/profile.dart';
import 'api/project.dart';
import 'api/resource.dart';
import 'api/storage_pool.dart';
import 'enums.dart';
import 'exception.dart';
import 'instance_id.dart';
import 'response.dart';

const _certificatePath = '/1.0/certificates/';
const _networkPath = '/1.0/networks/';
const _operationPath = '/1.0/operations/';
const _profilePath = '/1.0/profiles/';
const _projectPath = '/1.0/projects/';
const _storagePoolPath = '/1.0/storage-pools/';

/// Manages a connection to the lxd server.
class LxdClient {
  final HttpClient _client;
  final Uri _url;

  dynamic _hostInfo;

  LxdClient._(Uri url, HttpClient? client)
      : _client = client ?? _createClient(url),
        _url = url;

  LxdClient({String? socketPath, HttpClient? client})
      : this._(
          Uri(
            scheme: 'unix',
            host: 'localhost',
            path: _resolveSocketPath(socketPath),
          ),
          client,
        );

  LxdClient.remote({required Uri url, HttpClient? client})
      : this._(url, client);

  static String _resolveSocketPath(String? socketPath) {
    final lxdDir = Platform.environment['LXD_DIR'];
    final paths = [
      if (socketPath != null) socketPath,
      if (lxdDir != null) lxdDir + '/unix.socket',
      '/var/snap/lxd/common/lxd/unix.socket',
    ];
    return paths.firstWhereOrNull((path) => File(path).existsSync()) ??
        '/var/lib/lxd/unix.socket';
  }

  static HttpClient _createClient(Uri url) {
    final client = HttpClient();
    client.userAgent = 'lxd.dart';
    if (url.scheme == 'unix') {
      client.connectionFactory = (uri, proxyHost, proxyPort) {
        final path = _resolveSocketPath(url.path);
        final address = InternetAddress(path, type: InternetAddressType.unix);
        return Socket.startConnect(address, 0);
      };
    }
    return client;
  }

  Uri get url => _url;

  /// Sets the user agent sent in requests to lxd.
  set userAgent(String? value) => _client.userAgent = value;

  /// Get the operations in progress (keyed by type).
  Future<Map<String, List<String>>> getOperations() async {
    var operationPaths = await _requestSync('GET', '/1.0/operations');
    var operationIds = <String, List<String>>{};
    for (var type in operationPaths.keys) {
      var ids = <String>[];
      for (var path in operationPaths[type]) {
        if (path.startsWith(_operationPath)) {
          ids.add(path.substring(_operationPath.length));
        }
      }
      operationIds[type] = ids;
    }

    return operationIds;
  }

  /// Get the current state of the operation with [id].
  Future<LxdOperation> getOperation(String id) async {
    var response = await _requestSync('GET', '/1.0/operations/$id');
    return LxdOperation.fromJson(response);
  }

  /// Get a websocket connection for the provided operation.
  Future<WebSocket> getOperationWebSocket(String id, String secret) {
    return WebSocket.connect(
      'ws://${_url.authority}/1.0/operations/$id/websocket?secret=$secret',
      customClient: _client,
    );
  }

  /// Wait for the operation with [id] to complete.
  Future<LxdOperation> waitOperation(String id, {Duration? timeout}) async {
    var response =
        await _requestSync('GET', '/1.0/operations/$id/wait', queryParameters: {
      if (timeout != null) 'timeout': timeout.inSeconds.toString(),
    });
    return LxdOperation.fromJson(response);
  }

  /// Cancel the operation with [id].
  Future<void> cancelOperation(String id) async {
    await _requestSync('DELETE', '/1.0/operations/$id');
  }

  /// Gets system resources information.
  Future<LxdResources> getResources() async {
    var data = await _requestSync('GET', '/1.0/resources');
    return LxdResources.fromJson(data);
  }

  /// Gets the fingerprints of the certificates provided by the LXD server.
  Future<List<String>> getCertificates() async {
    var certificatePaths = await _requestSync('GET', '/1.0/certificates');
    var fingerprints = <String>[];
    for (var path in certificatePaths) {
      if (path.startsWith(_certificatePath)) {
        fingerprints.add(path.substring(_certificatePath.length));
      }
    }
    return fingerprints;
  }

  /// Gets information on a certificate with [fingerprint].
  Future<LxdCertificate> getCertificate(String fingerprint) async {
    var certificate =
        await _requestSync('GET', '/1.0/certificates/$fingerprint');
    return LxdCertificate.fromJson(certificate);
  }

  /// Gets a stream of LXD events.
  Stream<LxdEvent> getEvents({
    String? project,
    Set<LxdEventType> types = const {},
  }) {
    return _getEvents(
      types: types,
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
  }

  /// Gets a stream of LXD events.
  Stream<LxdEvent> getAllEvents({Set<LxdEventType> types = const {}}) {
    return _getEvents(
      types: types,
      queryParameters: {'all-projects': 'true'},
    );
  }

  Stream<LxdEvent> _getEvents({
    Set<LxdEventType> types = const {},
    Map<String, dynamic> queryParameters = const {},
  }) async* {
    final url = Uri(
      scheme: 'ws',
      host: _url.host,
      path: '/1.0/events',
      queryParameters: {
        ...queryParameters,
        if (types.isNotEmpty) 'type': types.map((t) => t.name).join(','),
      },
    );
    final ws = await WebSocket.connect(url.toString(), customClient: _client);
    try {
      await for (final event in ws) {
        yield LxdEvent.fromJson(json.decode(event.toString()));
      }
    } finally {
      await ws.close();
    }
  }

  /// Gets the fingerprints of the images provided by the LXD server.
  Future<List<String>> getImages({String? project, String? filter}) async {
    final images = await _requestSync(
      'GET',
      '/1.0/images',
      queryParameters: {
        if (project != null) 'project': project,
        if (filter != null) 'filter': filter,
      },
    ) as List;
    return images.cast<String>().map((p) => p.split('/').last).toList();
  }

  /// Gets information on an image with [id].
  Future<LxdImage> getImage(String fingerprint, {String? project}) async {
    var image = await _requestSync(
      'GET',
      '/1.0/images/$fingerprint',
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
    return LxdImage.fromJson(image);
  }

  /// Gets the names of the instances provided by the LXD server.
  Future<List<LxdInstanceId>> getInstances({String? project, String? filter}) {
    return _getInstances(
      queryParameters: {
        if (project != null) 'project': project,
        if (filter != null) 'filter': filter,
      },
    );
  }

  /// Gets the names of the instances provided by the LXD server.
  Future<List<LxdInstanceId>> getAllInstances({String? filter}) {
    return _getInstances(
      queryParameters: {
        if (filter != null) 'filter': filter,
        'all-projects': 'true',
      },
    );
  }

  Future<List<LxdInstanceId>> _getInstances({
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final instances = await _requestSync(
      'GET',
      '/1.0/instances',
      queryParameters: queryParameters,
    ) as List;
    return instances.cast<String>().map(LxdInstanceId.fromPath).toList();
  }

  /// Gets information on the instance with [id].
  Future<LxdInstance> getInstance(LxdInstanceId id) async {
    final instance = await _requestSync(
      'GET',
      '/1.0/instances/${id.name}',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
    );
    return LxdInstance.fromJson(instance);
  }

  /// Gets runtime state of the instance with [id].
  Future<LxdInstanceState> getInstanceState(LxdInstanceId id) async {
    final state = await _requestSync(
      'GET',
      '/1.0/instances/${id.name}/state',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
    );
    return LxdInstanceState.fromJson(state);
  }

  /// Creates a new instance from [image].
  Future<LxdOperation> createInstance({
    String? project,
    String? architecture,
    Map<String, String>? config,
    Map<String, Map<String, String>>? devices,
    bool? ephemeral,
    List<String>? profiles,
    String? restore,
    bool? stateful,
    String? description,
    String? name,
    required LxdImage source, // TODO: InstanceSource
    String? server,
    String? instanceType,
    LxdImageType? type,
  }) async {
    return await _requestAsync(
      'POST',
      '/1.0/instances',
      queryParameters: {
        if (project != null) 'project': project,
      },
      body: {
        if (architecture != null) 'architecture': architecture,
        if (config != null) 'config': config,
        if (devices != null) 'devices': devices,
        if (ephemeral != null) 'ephemeral': ephemeral,
        if (profiles != null) 'profiles': profiles,
        if (restore != null) 'restore': restore,
        if (stateful != null) 'stateful': stateful,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
        'source': {
          ...source.toJson(), // TODO: InstanceSource
          'type': 'image',
          if (server != null) 'protocol': 'simplestreams',
          if (server != null) 'server': server,
        },
        if (instanceType != null) 'type': instanceType,
        'type': () {
          switch (type ?? source.type) {
            case LxdImageType.container:
              return 'container';
            case LxdImageType.virtualMachine:
              return 'virtual-machine';
          }
        }(),
      },
    );
  }

  /// Starts the instance with [name].
  Future<LxdOperation> startInstance(
    LxdInstanceId id, {
    bool force = false,
  }) async {
    return await _requestAsync(
      'PUT',
      '/1.0/instances/${id.name}/state',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
      body: {'action': 'start', 'force': force},
    );
  }

  /// Executes a command in the instance with [name].
  Future<LxdOperation> execInstance(
    LxdInstanceId id, {
    required List<String> command,
    String? workingDirectory,
    Map<String, String>? environment,
    int? user,
    int? group,
    bool? interactive,
    bool? recordOutput,
    int? width,
    int? height,
    bool? waitForWebSocket,
  }) async {
    // TODO: which parameters are required?
    return await _requestAsync(
      'POST',
      '/1.0/instances/${id.name}/exec',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
      body: {
        'command': command,
        if (workingDirectory != null) 'cwd': workingDirectory,
        if (environment != null) 'environment': environment,
        if (user != null) 'user': user,
        if (group != null) 'group': group,
        if (interactive != null) 'interactive': interactive,
        if (recordOutput != null) 'record-output': recordOutput,
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        if (waitForWebSocket != null) 'wait-for-websocket': waitForWebSocket,
      },
    );
  }

  Future<LxdOperation> updateInstance(LxdInstance instance) async {
    return await _requestAsync(
      'PUT',
      '/1.0/instances/${instance.name}',
      queryParameters: {
        if (instance.project.isNotEmpty) 'project': instance.project,
      },
      body: instance.toJson(),
    );
  }

  /// Stops the instance with [id].
  Future<LxdOperation> stopInstance(
    LxdInstanceId id, {
    bool force = false,
    Duration? timeout,
  }) async {
    return await _requestAsync(
      'PUT',
      '/1.0/instances/${id.name}/state',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
      body: {
        'action': 'stop',
        'force': force,
        if (timeout != null) 'timeout': timeout.inSeconds,
      },
    );
  }

  /// Restarts the instance with [id].
  Future<LxdOperation> restartInstance(
    LxdInstanceId id, {
    bool force = false,
    Duration? timeout,
  }) async {
    return await _requestAsync(
      'PUT',
      '/1.0/instances/${id.name}/state',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
      body: {
        'action': 'restart',
        'force': force,
        if (timeout != null) 'timeout': timeout.inSeconds,
      },
    );
  }

  /// Deletes the instance with [id].
  Future<LxdOperation> deleteInstance(LxdInstanceId id) async {
    return await _requestAsync(
      'DELETE',
      '/1.0/instances/${id.name}',
      queryParameters: {
        if (id.project.isNotEmpty) 'project': id.project,
      },
    );
  }

  Future<String> pullFile(LxdInstanceId id, {required String path}) async {
    var request = await _client.openUrl(
      'GET',
      _url.resolve('/1.0/instances/${id.name}/files').replace(queryParameters: {
        'path': path,
        if (id.project.isNotEmpty) 'project': id.project,
      }),
    );
    final response = await request.close();
    return await response.transform(utf8.decoder).join();
  }

  Future<void> deleteFile(LxdInstanceId id, {required String path}) {
    return _requestSync(
      'DELETE',
      '/1.0/instances/${id.name}/files',
      queryParameters: {
        'path': path,
        if (id.project.isNotEmpty) 'project': id.project,
      },
    );
  }

  Future<void> pushFile(
    LxdInstanceId id, {
    required String path,
    String? data,
    int? uid,
    int? gid,
    String? mode,
    LxdFileType? type,
    LxdWriteMode? write,
  }) {
    return _requestSync(
      'POST',
      '/1.0/instances/${id.name}/files',
      queryParameters: {
        'path': path,
        if (id.project.isNotEmpty) 'project': id.project,
      },
      headers: {
        if (uid != null) 'X-LXD-uid': uid,
        if (gid != null) 'X-LXD-gid': gid,
        if (mode != null) 'X-LXD-mode': mode,
        if (type != null) 'X-LXD-type': type.name,
        if (write != null) 'X-LXD-write': write.name,
      },
      body: data,
    );
  }

  /// Gets the names of the networks provided by the LXD server.
  Future<List<String>> getNetworks() async {
    var networkPaths = await _requestSync('GET', '/1.0/networks');
    var networkNames = <String>[];
    for (var path in networkPaths) {
      if (path.startsWith(_networkPath)) {
        networkNames.add(path.substring(_networkPath.length));
      }
    }
    return networkNames;
  }

  /// Gets information on the network with [name].
  Future<LxdNetwork> getNetwork(String name) async {
    var network = await _requestSync('GET', '/1.0/networks/$name');
    return LxdNetwork.fromJson(network);
  }

  /// Gets DHCP leases on the network with [name].
  Future<List<LxdNetworkLease>> getNetworkLeases(String name) async {
    var leaseList = await _requestSync('GET', '/1.0/networks/$name/leases');
    var leases = <LxdNetworkLease>[];
    for (var lease in leaseList) {
      leases.add(LxdNetworkLease.fromJson(lease));
    }
    return leases;
  }

  /// Gets the current network state of the network with [name].
  Future<LxdNetworkState> getNetworkState(String name) async {
    var state = await _requestSync('GET', '/1.0/networks/$name/state');
    return LxdNetworkState.fromJson(state);
  }

  /// Gets the names of the network ACLs provided by the LXD server.
  Future<List<String>> getNetworkAcls({String? project}) async {
    final acls = await _requestSync(
      'GET',
      '/1.0/network-acls',
      queryParameters: {
        if (project != null) 'project': project,
      },
    ) as List;
    return acls.cast<String>().map((s) => s.split('/').last).toList();
  }

  /// Gets information on the network ACL with [id].
  Future<LxdNetworkAcl> getNetworkAcl(String name, {String? project}) async {
    final acl = await _requestSync(
      'GET',
      '/1.0/network-acls/$name',
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
    return LxdNetworkAcl.fromJson(acl);
  }

  /// Gets the names of the profiles provided by the LXD server.
  Future<List<String>> getProfiles({String? project}) async {
    var profilePaths = await _requestSync(
      'GET',
      '/1.0/profiles',
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
    var profileNames = <String>[];
    for (var path in profilePaths) {
      if (path.startsWith(_profilePath)) {
        profileNames.add(path.substring(_profilePath.length));
      }
    }
    return profileNames;
  }

  /// Gets information on the profile with [name].
  Future<LxdProfile> getProfile(String name, {String? project}) async {
    var profile = await _requestSync(
      'GET',
      '/1.0/profiles/$name',
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
    return LxdProfile.fromJson(profile);
  }

  /// Gets the names of the projects provided by the LXD server.
  Future<List<String>> getProjects() async {
    var projectPaths = await _requestSync('GET', '/1.0/projects');
    var projectNames = <String>[];
    for (var path in projectPaths) {
      if (path.startsWith(_projectPath)) {
        projectNames.add(path.substring(_projectPath.length));
      }
    }
    return projectNames;
  }

  /// Gets information on the project with [name].
  Future<LxdProject> getProject(String name) async {
    var project = await _requestSync('GET', '/1.0/projects/$name');
    return LxdProject.fromJson(project);
  }

  /// Gets the names of the storage pools provided by the LXD server.
  Future<List<String>> getStoragePools({String? project}) async {
    var poolPaths = await _requestSync(
      'GET',
      '/1.0/storage-pools',
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
    var poolNames = <String>[];
    for (var path in poolPaths) {
      if (path.startsWith(_storagePoolPath)) {
        poolNames.add(path.substring(_storagePoolPath.length));
      }
    }
    return poolNames;
  }

  /// Gets information on the pool with [name].
  Future<LxdStoragePool> getStoragePool(String name, {String? project}) async {
    var pool = await _requestSync(
      'GET',
      '/1.0/storage-pools/$name',
      queryParameters: {
        if (project != null) 'project': project,
      },
    );
    return LxdStoragePool.fromJson(pool);
  }

  /// Terminates all active connections. If a client remains unclosed, the Dart process may not terminate.
  void close() {
    _client.close();
  }

  Future<void> _connect() async {
    _hostInfo ??= await _requestSync('GET', '/1.0');
  }

  /// Does a synchronous request to lxd.
  Future<dynamic> _requestSync(
    String method,
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, Object> headers = const {},
    dynamic body,
  }) async {
    // Get host information first.
    if (method != 'GET' || path != '/1.0') {
      await _connect();
    }

    var request = await _client.openUrl(
      method,
      _url.resolve(path).replace(queryParameters: queryParameters),
    );
    for (final header in headers.entries) {
      request.headers.add(header.key, header.value);
    }
    if (body != null) request.write(body);
    await request.close();
    var lxdResponse = await _parseResponse<LxdSyncResponse>(await request.done);
    return lxdResponse.metadata;
  }

  /// Does an asynchronous request to lxd.
  Future<dynamic> _requestAsync(
    String method,
    String path, {
    Map<String, dynamic> queryParameters = const {},
    dynamic body,
  }) async {
    await _connect();
    var request = await _client.openUrl(
      method,
      _url.resolve(path).replace(queryParameters: queryParameters),
    );
    request.headers.contentType = ContentType('application', 'json');
    request.write(json.encode(body));
    await request.close();
    var lxdResponse =
        await _parseResponse<LxdAsyncResponse>(await request.done);
    return LxdOperation.fromJson(lxdResponse.metadata);
  }

  /// Decodes a response from lxd.
  Future<T> _parseResponse<T>(HttpClientResponse data) async {
    var body = await data.transform(utf8.decoder).join();
    var response = LxdResponse.fromJson(json.decode(body));
    if (response is LxdErrorResponse) {
      throw LxdException(response.errorCode, error: response.error);
    }
    return response as T;
  }
}

extension LxdWebSocket on WebSocket {
  void sendTermSize(int width, int height) {
    add(jsonEncode({
      'command': 'window-resize',
      'args': {'width': '$width', 'height': '$height'},
    }));
  }

  void forwardSignal(int signal) {
    add(jsonEncode({'command': 'signal', 'signal': signal}));
  }
}
