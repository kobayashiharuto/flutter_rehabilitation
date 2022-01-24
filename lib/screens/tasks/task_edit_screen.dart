import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/providers/task_create_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:test_interval/data/providers/task_edit_controller.dart';
import 'package:test_interval/data/providers/task_list_controller.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:collection/collection.dart';

class TaskEditScreen extends HookConsumerWidget {
  const TaskEditScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _task = ref
        .read(taskListViewController)
        .tasks
        .firstWhereOrNull((item) => item.id == id);
    final _taskVM = ref.watch(taskEditViewController(_task!).notifier);

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
                context.goNamed('detail', params: {'id': id});
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
