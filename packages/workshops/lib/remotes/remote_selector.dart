import 'package:flutter/material.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';

import 'remote_store.dart';

class RemoteSelector extends StatefulWidget {
  const RemoteSelector({super.key, this.enabled = true});

  final bool enabled;

  @override
  State<RemoteSelector> createState() => _RemoteSelectorState();
}

class _RemoteSelectorState extends State<RemoteSelector> {
  @override
  void initState() {
    super.initState();
    final store = context.read<RemoteStore>();
    WidgetsBinding.instance.addPostFrameCallback((_) => store.init());
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<RemoteStore>();
    final remotes = store.remotes.value ?? [];
    return DropdownButtonFormField<LxdRemote>(
      decoration: const InputDecoration(
        labelText: 'Remote',
      ),
      value: store.current,
      items: remotes.map((remote) {
        return DropdownMenuItem<LxdRemote>(
          value: remote,
          child: Text(remote.name),
        );
      }).toList(),
      onChanged: widget.enabled ? store.setCurrent : null,
    );
  }
}
