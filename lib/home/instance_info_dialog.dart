import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

Future<void> showInstanceInfoDialog(
    {required BuildContext context, required String instanceName}) async {
  final state = await getService<LxdService>().getInstanceState(instanceName);

  final interfaces = Map<String, LxdInstanceNetworkState>.from(state.network!)
    ..removeWhere((interface, _) => interface == 'lo');
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Network information'),
      // content: Text(ips?.join(' ') ?? ''),
      content: Table(
        defaultColumnWidth: const IntrinsicColumnWidth(),
        children: [
          TableRow(
              children: const [Text('Interface'), Text('IPv4'), Text('IPv6')]
                  .map((e) =>
                      Padding(padding: const EdgeInsets.all(8), child: e))
                  .toList()),
          for (final e in interfaces.entries)
            TableRow(
              children: [
                SelectableText(e.key),
                SelectableText(e.value.addresses
                        .singleWhereOrNull((address) =>
                            address.family == LxdNetworkFamily.inet)
                        ?.address ??
                    ''),
                SelectableText(e.value.addresses
                        .singleWhereOrNull((address) =>
                            address.family == LxdNetworkFamily.inet6)
                        ?.address ??
                    ''),
              ]
                  .map((e) =>
                      Padding(padding: const EdgeInsets.all(8), child: e))
                  .toList(),
            )
        ],
      ),
    ),
  );
}
