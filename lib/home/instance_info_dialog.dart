import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_service/lxd_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

Future<void> showInstanceInfoDialog(
    {required BuildContext context, required String instanceName}) async {
  final l10n = AppLocalizations.of(context);

  final state = await getService<LxdService>().getInstanceState(instanceName);
  final interfaces = Map<String, LxdInstanceNetworkState>.from(state.network!)
    ..removeWhere((interface, _) => interface == 'lo');

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.networkInformation),
      content: Table(
        defaultColumnWidth: const IntrinsicColumnWidth(),
        children: [
          TableRow(
              children: [
            Text(l10n.networkInterface),
            const Text('IPv4'),
            const Text('IPv6')
          ]
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
