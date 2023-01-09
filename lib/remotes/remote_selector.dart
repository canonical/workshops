import 'package:flutter/material.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:provider/provider.dart';

import 'remote_store.dart';

class RemoteSelector extends StatelessWidget {
  const RemoteSelector({super.key, this.enabled = true});

  final bool enabled;

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
      onChanged: enabled ? store.setCurrent : null,
    );
  }
}
