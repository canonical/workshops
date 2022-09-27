import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'terminal_state.dart';
import 'terminal_watcher.dart';

class TerminalProgress extends StatelessWidget {
  const TerminalProgress(this.state, {super.key});

  final TerminalState state;

  static Widget create(BuildContext context, TerminalState state) {
    return ChangeNotifierProvider<TerminalWatcher>(
      key: ObjectKey(state),
      create: (_) => TerminalWatcher(state, getService<LxdService>()),
      child: TerminalProgress(state),
    );
  }

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<TerminalWatcher>();
    final title = state.when(
      none: () => '',
      create: (name, op) => 'Creating instance',
      init: (instance, feature) => 'Creating ${feature.name}',
      config: (instance, feature) => 'Configuring ${feature.name}',
      stage: (instance, op) => 'Finalizing features',
      start: (instance, op) => 'Starting instance',
      restart: (instance, op) => 'Restarting instance',
      running: (instance, op) => 'Running instance',
      stop: (instance, op) => 'Stopping instance',
      error: (message) => message ?? '',
    );
    return Scaffold(
      body: Center(
        child: watcher.operation.map(
          data: (data) => _TerminalProgress(
            title: title,
            op: data.value,
            onCancel: watcher.cancel,
          ),
          error: (error) => Text('TODO: ${error.error}'),
          loading: (loading) =>
              _TerminalProgress(title: title, op: loading.value),
        ),
      ),
    );
  }
}

class _TerminalProgress extends StatefulWidget {
  const _TerminalProgress(
      {required this.title, required this.op, this.onCancel});

  final String title;
  final LxdOperation? op;
  final VoidCallback? onCancel;

  @override
  State<_TerminalProgress> createState() => _TerminalProgressState();
}

class _TerminalProgressState extends State<_TerminalProgress> {
  @override
  void initState() {
    super.initState();
    final watcher = context.read<TerminalWatcher>();
    WidgetsBinding.instance.addPostFrameCallback((_) => watcher.init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox.square(
              dimension: 96,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 48),
            Text(
              widget.op?.downloadProgress != null
                  ? 'Downloading instance'
                  : widget.op?.unpackProgress != null
                      ? 'Unpacking instance'
                      : widget.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: Theme.of(context).appBarTheme.toolbarHeight,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    widget.op?.downloadProgress ??
                        widget.op?.unpackProgress ??
                        'Please wait',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              ButtonBar(
                children: [
                  if (widget.onCancel != null && widget.op?.mayCancel == true)
                    OutlinedButton(
                      onPressed: widget.onCancel,
                      child: const Text('Cancel'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension _LxdOperationX on LxdOperation {
  // double? get progressValue =>
  //     (metadata?['progress']?['percentage'] as int?).asProgressValue;
  String? get downloadProgress => metadata?['download_progress'] as String?;
  String? get unpackProgress =>
      metadata?['create_instance_from_image_unpack_progress'] as String?;
}

// extension _Percentage on int? {
//   double? get asProgressValue => this != null ? this! / 100.0 : null;
// }
