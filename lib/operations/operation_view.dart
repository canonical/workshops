import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'operation_watcher.dart';
import 'operation_x.dart';

class OperationView extends StatelessWidget {
  const OperationView({super.key, required this.title});

  final String title;

  static Widget create(BuildContext context, String id) {
    return ChangeNotifierProvider(
      key: Key(id),
      create: (_) => OperationWatcher(id, getService<LxdService>()),
      child: const OperationView(title: 'Creating instance'),
    );
  }

  static Widget config(BuildContext context, String instance) {
    return ChangeNotifierProvider<OperationWatcher>(
      key: Key(instance),
      create: (_) => InstanceWatcher(instance, getService<LxdService>()),
      child: const OperationView(title: 'Configuring instance'),
    );
  }

  static Widget restart(BuildContext context, String id) {
    return ChangeNotifierProvider<OperationWatcher>(
      key: Key(id),
      create: (_) => OperationWatcher(id, getService<LxdService>()),
      child: const OperationView(title: 'Restarting instance'),
    );
  }

  static Widget start(BuildContext context, String id) {
    return ChangeNotifierProvider<OperationWatcher>(
      key: Key(id),
      create: (_) => OperationWatcher(id, getService<LxdService>()),
      child: const OperationView(title: 'Starting instance'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<OperationWatcher>();
    return Scaffold(
      body: Center(
        child: watcher.operation.map(
          data: (data) => _OperationView(
            title: title,
            op: data.value,
            onCancel: watcher.cancel,
          ),
          error: (error) => Text('TODO: ${error.error}'),
          loading: (loading) => _OperationView(title: title, op: loading.value),
        ),
      ),
    );
  }
}

class _OperationView extends StatefulWidget {
  const _OperationView({required this.title, required this.op, this.onCancel});

  final String title;
  final LxdOperation? op;
  final VoidCallback? onCancel;

  @override
  State<_OperationView> createState() => _OperationViewState();
}

class _OperationViewState extends State<_OperationView> {
  @override
  void initState() {
    super.initState();
    final watcher = context.read<OperationWatcher>();
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
