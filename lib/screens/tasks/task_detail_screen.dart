import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/providers/task_list_controller.dart';
import 'package:go_router/go_router.dart';

class TaskDetailScreen extends HookConsumerWidget {
  const TaskDetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _task = ref
        .watch(taskListViewController)
        .tasks
        .firstWhereOrNull((item) => item.id == id);

    if (_task == null) {
      return Scaffold(body: Text('not'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.goNamed('edit', params: {'id': id}),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  _task.title,
                  style: const TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Icon(
                    _task.completed
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    size: 20),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _task.description,
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
