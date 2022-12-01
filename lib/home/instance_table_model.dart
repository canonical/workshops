import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:lxd/lxd.dart';
import 'package:lxd_x/lxd_x.dart';

import 'instance_store.dart';

enum InstanceTableColumn { name, project }

class InstanceTableModel extends ChangeNotifier {
  InstanceTableModel(this._store);

  final InstanceStore _store;

  List<LxdInstanceId> get instances => _instances ?? <LxdInstanceId>[];
  List<LxdInstanceId>? _instances;

  List<String> get projects => _projects ?? [];
  List<String>? _projects;

  Set<String> get selectedProjects => _selectedProjects;
  final _selectedProjects = <String>{kLxdDefaultProject};

  bool isProjectSelected(String project) => _selectedProjects.contains(project);
  void selectProject(String project, bool selected) {
    if (selected) {
      _selectedProjects.add(project);
    } else {
      _selectedProjects.remove(project);
    }
    _sortAndFilter();
  }

  InstanceTableColumn get sortColumn => _sortColumn;
  var _sortColumn = InstanceTableColumn.name;

  bool get sortAscending => _sortAscending;
  var _sortAscending = true;

  void sort(int columnIndex, bool ascending) {
    final column = InstanceTableColumn.values[columnIndex];
    if (_sortColumn == column && _sortAscending == ascending) return;
    _sortColumn = column;
    _sortAscending = ascending;
    _sortAndFilter();
  }

  String get filterKey => _filterKey;
  var _filterKey = '';

  void filter(String key) {
    if (_filterKey == key) return;
    _filterKey = key;
    _sortAndFilter();
  }

  void _sortAndFilter() {
    int compareName(LxdInstanceId a, LxdInstanceId b) {
      return _sortAscending
          ? a.name.compareTo(b.name)
          : b.name.compareTo(a.name);
    }

    int compareProject(LxdInstanceId a, LxdInstanceId b) {
      final order = _sortAscending
          ? a.project.compareTo(b.project)
          : b.project.compareTo(a.project);
      if (order != 0) return order;
      return compareName(a, b);
    }

    int compareInstance(LxdInstanceId a, LxdInstanceId b) {
      switch (_sortColumn) {
        case InstanceTableColumn.name:
          return compareName(a, b);
        case InstanceTableColumn.project:
          return compareProject(a, b);
      }
    }

    bool filterInstance(LxdInstanceId id) {
      final lower = _filterKey.toLowerCase();
      return _selectedProjects.contains(id.project) &&
          (_filterKey.isEmpty ||
              id.name.toLowerCase().contains(lower) ||
              _store.getInstance(id)?.summary?.toLowerCase().contains(lower) ==
                  true);
    }

    final uniqueProjects = <String>{};
    final filteredInstances = <LxdInstanceId>[];
    for (final id in _store.instances.value ?? <LxdInstanceId>[]) {
      uniqueProjects.add(id.project);
      if (filterInstance(id)) filteredInstances.add(id);
    }

    _projects = uniqueProjects.sorted();
    _instances = filteredInstances.sorted(compareInstance);
    notifyListeners();
  }

  var _dirty = false;
  void _invalidate() {
    if (_dirty) return;
    _dirty = true;
    Timer(const Duration(milliseconds: 16), () {
      _sortAndFilter();
      _dirty = false;
    });
  }

  Future<void> init() async {
    _sortAndFilter();
    _store.addListener(_invalidate);
  }

  @override
  void dispose() {
    _store.removeListener(_invalidate);
    super.dispose();
  }
}
