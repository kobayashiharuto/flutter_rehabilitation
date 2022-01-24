import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/providers/task_create_controller.dart';

class TaskCreateScreen extends HookConsumerWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _taskCreateVM = ref.watch(taskCreateViewController.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _taskCreateVM.titleController,
              focusNode: _taskCreateVM.titleFocusNode,
              autofocus: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _taskCreateVM.descriptionController,
              focusNode: _taskCreateVM.descriptionFocusNode,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                _taskCreateVM.submit();
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
