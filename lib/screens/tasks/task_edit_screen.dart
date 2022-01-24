import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_interval/data/providers/task_edit_controller.dart';
import 'package:test_interval/data/providers/task_list_controller.dart';

class TaskEditScreen extends HookConsumerWidget {
  const TaskEditScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _task = ref.watch(taskListViewController).getTask(id);

    if (_task == null) {
      return const Scaffold(body: Text(''));
    }

    final _taskVM = ref.watch(taskEditViewController(_task).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _taskVM.titleController,
              focusNode: _taskVM.titleFocusNode,
              autofocus: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _taskVM.descriptionController,
              focusNode: _taskVM.descriptionFocusNode,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                _taskVM.update();
                Routemaster.of(context).push('/tasks/detail/$id');
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
