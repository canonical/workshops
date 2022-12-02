import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class ConfigEditorModel extends SafeChangeNotifier {
  ConfigEditorModel({
    required Map<String, String> config,
    required this.configScheme,
    required this.onSaved,
  }) : _config = Map.from(config);
  final Map<String, String> _config;
  final Map<String, ConfigSchemeEntry> configScheme;
  Future<void> Function(Map<String, String> config) onSaved;

  UnmodifiableMapView<String, String> get config =>
      UnmodifiableMapView(_config);

  void updateValue(String key, String value) {
    if (_config[key] == value) return;
    _config[key] = value;
    notifyListeners();
  }

  void resetValue(String key) {
    _config.remove(key);
    notifyListeners();
  }

  Future<void> save() => onSaved(config);
}

class ConfigSchemeEntry<T> {
  const ConfigSchemeEntry({
    this.defaultValue,
    this.allowedValues,
    required this.description,
  });
  final T? defaultValue;
  final List<T>? allowedValues;
  final String description;
  Type get type => T;
}

const kProjectConfigScheme = {
  'backups.compression_algorithm': ConfigSchemeEntry<String>(
      description:
          'Compression algorithm to use for backups (bzip2, gzip, lzma, xz or none) in the project'),
  'features.images': ConfigSchemeEntry<bool>(
      defaultValue: true,
      description: 'Separate set of images and image aliases for the project'),
  'features.networks': ConfigSchemeEntry<bool>(
      defaultValue: false,
      description: 'Separate set of networks for the project'),
  'features.networks.zones': ConfigSchemeEntry<bool>(
      defaultValue: false,
      description: 'Separate set of network zones for the project'),
  'features.profiles': ConfigSchemeEntry<bool>(
      defaultValue: true,
      description: 'Separate set of profiles for the project'),
  'features.storage.buckets': ConfigSchemeEntry<bool>(
      defaultValue: true,
      description: 'Separate set of storage buckets for the project'),
  'features.storage.volumes': ConfigSchemeEntry<bool>(
      defaultValue: true,
      description: 'Separate set of storage volumes for the project'),
  'images.auto_update_cached': ConfigSchemeEntry<bool>(
      description: 'Whether to automatically update any image that LXD caches'),
  'images.auto_update_interval': ConfigSchemeEntry<int>(
      description:
          'Interval in hours at which to look for update to cached images (0 disables it)'),
  'images.compression_algorithm': ConfigSchemeEntry<String>(
      description:
          'Compression algorithm to use for images (bzip2, gzip, lzma, xz or none) in the project'),
  'images.default_architecture': ConfigSchemeEntry<String>(
      description:
          'Default architecture which should be used in mixed architecture cluster'),
  'images.remote_cache_expiry': ConfigSchemeEntry<int>(
      description:
          'Number of days after which an unused cached remote image will be flushed in the project'),
  'limits.containers': ConfigSchemeEntry<int>(
      description:
          'Maximum number of containers that can be created in the project'),
  'limits.cpu': ConfigSchemeEntry<int>(
      description:
          'Maximum value for the sum of individual limits.cpu configurations set on the instances of the project'),
  'limits.disk': ConfigSchemeEntry<String>(
      description:
          'Maximum value of aggregate disk space used by all instances volumes, custom volumes and images of the project'),
  'limits.instances': ConfigSchemeEntry<int>(
      description:
          'Maximum number of total instances that can be created in the project'),
  'limits.memory': ConfigSchemeEntry<String>(
      description:
          'Maximum value for the sum of individual limits.memory configurations set on the instances of the project'),
  'limits.networks': ConfigSchemeEntry<int>(
      description:
          'Maximum value for the number of networks this project can have'),
  'limits.processes': ConfigSchemeEntry<int>(
      description:
          'Maximum value for the sum of individual limits.processes configurations set on the instances of the project'),
  'limits.virtual-machines': ConfigSchemeEntry<int>(
      description: 'Maximum number of VMs that can be created in the project'),
  'restricted': ConfigSchemeEntry<bool>(
      defaultValue: false,
      description:
          'Block access to security-sensitive features (this must be enabled to allow the restricted.* keys to take effect, this is so it can be temporarily disabled if needed without having to clear the related keys)'),
  'restricted.backups': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents the creation of any instance or volume backups.'),
  'restricted.cluster.groups': ConfigSchemeEntry<String>(
      description:
          'Prevents targeting cluster groups other than the provided ones.'),
  'restricted.cluster.target': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Prevents direct targeting of cluster members when creating or moving instances.'),
  'restricted.containers.lowlevel': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Prevents use of low-level container options like raw.lxc, raw.idmap, volatile etc.'),
  'restricted.containers.nesting': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents setting security.nesting=true.'),
  'restricted.containers.privilege': ConfigSchemeEntry<String>(
      defaultValue: 'unpriviliged',
      description:
          'If unpriviliged, prevents setting security.privileged=true. If isolated, prevents setting security.privileged=true and also security.idmap.isolated=true. If allow, no restriction apply.'),
  'restricted.containers.interception': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Prevents use for system call interception options. When set to allow usually safe interception options will be allowed (file system mounting will remain blocked).'),
  'restricted.devices.disk': ConfigSchemeEntry<String>(
      defaultValue: 'managed',
      description:
          'If block prevent use of disk devices except the root one. If managed allow use of disk devices only if pool= is set. If allow, no restrictions apply.'),
  'restricted.devices.disk.paths': ConfigSchemeEntry<String>(
      description:
          'If restricted.devices.disk is set to allow, this sets a comma-separated list of path prefixes that restrict the source setting on disk devices. If empty then all paths are allowed.'),
  'restricted.devices.gpu': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type gpu'),
  'restricted.devices.infiniband': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type infiniband'),
  'restricted.devices.nic': ConfigSchemeEntry<String>(
      defaultValue: 'managed',
      description:
          'If block prevent use of all network devices. If managed allow use of network devices only if network= is set. If allow, no restrictions apply. This also controls access to networks.'),
  'restricted.devices.pci': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type pci'),
  'restricted.devices.proxy': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type proxy'),
  'restricted.devices.unix-block': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type unix-block'),
  'restricted.devices.unix-char': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type unix-char'),
  'restricted.devices.unix-hotplug': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type unix-hotplug'),
  'restricted.devices.usb': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description: 'Prevents use of devices of type usb'),
  'restricted.idmap.uid': ConfigSchemeEntry<String>(
      description:
          'Specifies the allowed host UID ranges allowed in the instance raw.idmap setting.'),
  'restricted.idmap.gid': ConfigSchemeEntry<String>(
      description:
          'Specifies the allowed host GID ranges allowed in the instance raw.idmap setting.'),
  'restricted.networks.access': ConfigSchemeEntry<String>(
      description:
          'Comma-delimited list of network names that are allowed for use in this project. If not set, all networks are accessible (depending on the restricted.devices.nic setting).'),
  'restricted.networks.subnets': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Comma-delimited list of network subnets from the uplink networks (in the form <uplink>:<subnet>) that are allocated for use in this project'),
  'restricted.networks.uplinks': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Comma-delimited list of network names that can be used as uplink for networks in this project'),
  'restricted.networks.zones': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Comma-delimited list of network zones that can be used (or something under them) in this project'),
  'restricted.snapshots': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Prevents the creation of any instance or volume snapshots.'),
  'restricted.virtual-machines.lowlevel': ConfigSchemeEntry<String>(
      defaultValue: 'block',
      description:
          'Prevents use of low-level virtual-machine options like raw.qemu, volatile etc.'),
};
