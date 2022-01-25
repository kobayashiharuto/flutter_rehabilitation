import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_interval/data/providers/task_list_controller.dart';

class TimelineScreen extends HookConsumerWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tasks = ref.watch(taskListViewController).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) => GestureDetector(
            child: Text(_tasks[index].title),
            onTap: () => Routemaster.of(context)
                .push('/tasks/detail/${_tasks[index].id!}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routemaster.of(context).push('/tasks/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
