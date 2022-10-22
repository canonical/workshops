import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'instance_store.dart';
import 'instance_tile.dart';

class InstanceView extends StatefulWidget {
  const InstanceView({super.key});

  @override
  State<InstanceView> createState() => _InstanceViewState();
}

class _InstanceViewState extends State<InstanceView> {
  @override
  void initState() {
    super.initState();
    final store = context.read<InstanceStore>();
    WidgetsBinding.instance.addPostFrameCallback((_) => store.init());
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<InstanceStore>();
    return store.instances.map(
      data: (data) => _InstanceListView(instances: data.value),
      loading: (loading) => _InstanceListView(instances: loading.value),
      error: (error) => Text('TODO: ${error.error}'),
    );
  }
}

class _InstanceListView extends StatelessWidget {
  const _InstanceListView({required this.instances});

  final List<String>? instances;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: instances?.length ?? 0,
      itemBuilder: (context, index) => InstanceTile.create(
        context,
        name: instances![index],
      ),
    );
  }
}
