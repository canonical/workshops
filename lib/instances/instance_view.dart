import 'package:async_value/async_value.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';
import 'package:provider/provider.dart';

import '../widgets/product_logo.dart';
import 'instance_model.dart';

class InstanceView extends StatefulWidget {
  const InstanceView({
    super.key,
    this.selected,
    this.onSelect,
    this.onStop,
    this.onDelete,
  });

  final String? selected;
  final ValueChanged<LxdInstance>? onSelect;
  final ValueChanged<LxdInstance>? onStop;
  final ValueChanged<LxdInstance>? onDelete;

  @override
  State<InstanceView> createState() => _InstanceViewState();
}

class _InstanceViewState extends State<InstanceView> {
  @override
  void initState() {
    super.initState();
    final model = context.read<InstanceModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => model.init());
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<InstanceModel>();
    return model.instances.map(
      data: (data) => _InstanceListView(
        instances: data.value,
        selected: widget.selected,
        onSelect: widget.onSelect,
        onStop: widget.onStop,
        onDelete: widget.onDelete,
      ),
      loading: (loading) => _InstanceListView(
        instances: loading.value,
        selected: widget.selected,
        onSelect: widget.onSelect,
        onStop: widget.onStop,
        onDelete: widget.onDelete,
      ),
      error: (error) => Text('TODO: ${error.error}'),
    );
  }
}

class _InstanceListView extends StatelessWidget {
  const _InstanceListView({
    required this.instances,
    this.selected,
    this.onSelect,
    this.onStop,
    this.onDelete,
  });

  final List<String>? instances;
  final String? selected;
  final ValueChanged<LxdInstance>? onSelect;
  final ValueChanged<LxdInstance>? onStop;
  final ValueChanged<LxdInstance>? onDelete;

  @override
  Widget build(BuildContext context) {
    final model = context.read<InstanceModel>();
    return ListView.builder(
      itemCount: instances?.length ?? 0,
      itemBuilder: (context, index) {
        final name = instances![index];
        return ChangeNotifierProvider(
          key: ValueKey(name),
          create: (_) => model.createState(name),
          child: _InstanceListTile(
            name: name,
            onSelect: onSelect,
            onStop: onStop,
            onDelete: onDelete,
          ),
        );
      },
    );
  }
}

class _InstanceListTile extends StatefulWidget {
  const _InstanceListTile({
    required this.name,
    this.onSelect,
    this.onStop,
    this.onDelete,
  });

  final String name;
  final ValueChanged<LxdInstance>? onSelect;
  final ValueChanged<LxdInstance>? onStop;
  final ValueChanged<LxdInstance>? onDelete;

  @override
  State<_InstanceListTile> createState() => _InstanceListTileState();
}

class _InstanceListTileState extends State<_InstanceListTile> {
  @override
  void initState() {
    super.initState();
    final model = context.read<InstanceState>();
    WidgetsBinding.instance.addPostFrameCallback((_) => model.init());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InstanceState>();
    final instance = state.instance.valueOrNull;
    final canStop = widget.onStop != null && instance?.isRunning == true;
    final canDelete = widget.onDelete != null && instance?.isStopped == true;
    final canSelect = widget.onSelect != null && instance != null;
    return ListTile(
      leading: ProductLogo.asset(name: instance?.imageName, size: 48),
      title: Text(instance?.name ?? ''),
      subtitle: Text(instance?.imageDescription ?? ''),
      trailing: instance?.isBusy == true
          ? _BusyButton()
          : canStop
              ? _StopButton(() => widget.onStop!(instance!))
              : canDelete
                  ? _DeleteButton(() => widget.onDelete!(instance!))
                  : null,
      onTap: canSelect ? () => widget.onSelect!(instance) : null,
    );
  }
}

extension _LxdInstanceImage on LxdInstance {
  String? get imageName => config['image.os']?.toLowerCase();
  String? get imageDescription => config['image.description'];
}

class _IconButton extends IconButton {
  const _IconButton({required super.icon, super.onPressed})
      : super(splashRadius: 24, iconSize: 16);
}

class _StopButton extends _IconButton {
  const _StopButton(VoidCallback onPressed)
      : super(icon: const Icon(Icons.stop), onPressed: onPressed);
}

class _DeleteButton extends _IconButton {
  const _DeleteButton(VoidCallback onPressed)
      : super(icon: const Icon(Icons.close), onPressed: onPressed);
}

class _BusyButton extends IconButton {
  _BusyButton()
      : super(
          icon: const SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {}, // block
        );
}
