import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/providers/task_controller.dart';
import 'package:go_router/go_router.dart';

class TaskCreateScreen extends HookConsumerWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _taskVM = ref.watch(taskCreateController.notifier);

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
                _taskVM.submit();
                context.goNamed('tasks');
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
