import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'operation_model.dart';
import 'operation_x.dart';

class OperationView extends StatelessWidget {
  const OperationView({super.key});

  static Widget create(BuildContext context, String id) {
    return ChangeNotifierProvider(
      create: (_) => OperationModel(id, getService<LxdService>()),
      child: const OperationView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OperationModel>();
    return Scaffold(
      body: Center(
        child: model.operation.map(
          data: (data) =>
              _OperationView(op: data.value, onCancel: model.cancel),
          error: (error) => Text('TODO: ${error.error}'),
          loading: (loading) => _OperationView(op: loading.value),
        ),
      ),
    );
  }
}

class _OperationView extends StatefulWidget {
  const _OperationView({required this.op, this.onCancel});

  final LxdOperation? op;
  final VoidCallback? onCancel;

  @override
  State<_OperationView> createState() => _OperationViewState();
}

class _OperationViewState extends State<_OperationView> {
  @override
  void initState() {
    super.initState();
    final model = context.read<OperationModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => model.init());
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
              widget.op?.description ?? 'Preparing...',
              style: Theme.of(context).textTheme.headlineLarge,
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
