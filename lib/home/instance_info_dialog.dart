import 'dart:io';

import 'package:collection/collection.dart';
import 'package:data_size/data_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lxd/lxd.dart';
import 'package:provider/provider.dart';

import 'instance_info_model.dart';

Future<void> showInstanceInfoDialog(
    {required BuildContext context, required String instanceName}) {
  final l10n = AppLocalizations.of(context);
  final model = InstanceInfoModel(instanceName: instanceName);
  return model.init().then((_) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.instanceInformationTitle),
          content: ChangeNotifierProvider(
            create: (_) => model,
            child: InstanceInfoPage(
              instanceName: instanceName,
            ),
          ),
          scrollable: true,
        ),
      ));
}

class InstanceInfoPage extends StatelessWidget {
  const InstanceInfoPage({
    super.key,
    required this.instanceName,
  });

  final String instanceName;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<InstanceInfoModel>();
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('General', style: Theme.of(context).textTheme.titleMedium),
        Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: [
            _TableRowPaddedSelectable(entries: [
              '${l10n.nameLabel}:',
              instanceName,
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.statusLabel}:',
              model.instanceState.status.toString(),
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.typeLabel}:',
              model.instance.type.toString(),
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.architectureLabel}:',
              model.instance.architecture.toString(),
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.pidLabel}:',
              model.instanceState.pid.toString(),
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.createdAtLabel}:',
              DateFormat.yMd(Platform.localeName)
                  .add_jm()
                  .format(model.instance.createdAt),
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.lastUsedAtLabel}:',
              DateFormat.yMd(Platform.localeName)
                  .add_jm()
                  .format(model.instance.lastUsedAt),
            ]),
          ],
        ),
        const SizedBox(height: 16),
        Text(l10n.resourcesLabel,
            style: Theme.of(context).textTheme.titleMedium),
        Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: [
            _TableRowPaddedSelectable(entries: [
              'Processes:',
              model.instanceState.processes.toString(),
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.cpuUsageLabel}:',
              '${((model.instanceState.cpu?.usage ?? 0) / 1e9).toStringAsFixed(1)} s',
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.memoryUsageLabel}:',
              model.instanceState.memory?.usage.formatByteSize() ?? '',
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.swapUsageLabel}:',
              model.instanceState.memory?.swapUsage.formatByteSize() ?? '',
            ]),
            _TableRowPaddedSelectable(entries: [
              '${l10n.diskUsageLabel}:',
              '${model.instanceState.disk?.values.firstOrNull?.usage.formatByteSize() ?? ''}'
                  ' (${model.instanceState.disk?.keys.firstOrNull})'
            ]),
            for (final disk in model.instanceState.disk?.entries.skip(1) ??
                const Iterable<MapEntry<String, LxdInstanceDiskState>>.empty())
              _TableRowPaddedSelectable(entries: [
                '',
                '${disk.value.usage.formatByteSize()} (${disk.key})'
              ]),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          l10n.networkInformationLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: [
            _TableRowPaddedSelectable(entries: [
              l10n.networkInterfaceLabel,
              'IPv4',
              'IPv6',
              l10n.receivedLabel,
              l10n.sentLabel,
            ]),
            for (final e in model.instanceState.network!.entries)
              _TableRowPaddedSelectable(entries: [
                (e.key),
                (e.value.addresses
                        .singleWhereOrNull((address) =>
                            address.family == LxdNetworkFamily.inet)
                        ?.address ??
                    ''),
                (e.value.addresses
                        .singleWhereOrNull((address) =>
                            address.family == LxdNetworkFamily.inet6)
                        ?.address ??
                    ''),
                (e.value.counters.bytesReceived.formatByteSize()),
                (e.value.counters.bytesSent.formatByteSize()),
              ])
          ],
        ),
      ],
    );
  }
}

class _TableRowPaddedSelectable extends TableRow {
  _TableRowPaddedSelectable({List<String>? entries})
      : super(
          children: entries
              ?.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    child: SelectableText(e),
                  ))
              .toList(),
        );
}
