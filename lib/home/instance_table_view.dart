import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'instance_store.dart';
import 'instance_table_model.dart';
import 'instance_table_row.dart';

class InstanceTableView extends StatelessWidget {
  const InstanceTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InstanceTableModel(context.read<InstanceStore>()),
      child: const _InstanceTableView(),
    );
  }
}

class _InstanceTableView extends StatefulWidget {
  const _InstanceTableView();

  @override
  State<_InstanceTableView> createState() => _InstanceTableViewState();
}

class _InstanceTableViewState extends State<_InstanceTableView> {
  @override
  void initState() {
    super.initState();
    final model = context.read<InstanceTableModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => model.init());
  }

  void _onSort(int column, bool ascending) {
    final model = context.read<InstanceTableModel>();
    model.sortColumn = InstanceTableColumn.values[column];
    model.sortAscending = ascending;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final model = context.watch<InstanceTableModel>();
    return DataTable2(
      headingRowColor:
          MaterialStateProperty.all(Theme.of(context).backgroundColor),
      sortArrowIcon: YaruIcons.pan_up,
      sortAscending: model.sortAscending,
      sortColumnIndex: model.sortColumn.index,
      columnSpacing: 10,
      horizontalMargin: 10,
      headingRowHeight: 36,
      dataRowHeight: kMinInteractiveDimension,
      columns: [
        DataColumn2(
          label: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: Text(l10n.instanceLabel),
          ),
          onSort: _onSort,
        ),
        if (model.selectedProjects.length > 1)
          DataColumn2(
            label: Padding(
              padding: const EdgeInsetsDirectional.only(end: 4),
              child: Text(l10n.projectLabel),
            ),
            fixedWidth: 200,
            onSort: _onSort,
          ),
        DataColumn2(
          label: Padding(
            padding: const EdgeInsetsDirectional.only(start: 2 * 36),
            child: PopupMenuButton(
              iconSize: 16,
              tooltip: '',
              itemBuilder: (context) {
                return [
                  for (final project in model.projects)
                    YaruMultiSelectPopupMenuItem(
                      checked: model.isProjectSelected(project),
                      child: Text(project),
                      onChanged: (value) => model.selectProject(project, value),
                    ),
                ];
              },
              icon: const Icon(Icons.filter_list),
            ),
          ),
          fixedWidth: 120,
        ),
      ],
      rows: model.instances.mapIndexed((index, id) {
        return buildInstanceTableRow(
          context,
          index: index,
          id: id,
        );
      }).toList(),
    );
  }
}
