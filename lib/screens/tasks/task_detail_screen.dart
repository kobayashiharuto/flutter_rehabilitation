import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_interval/data/providers/task_list_controller.dart';

class TaskDetailScreen extends HookConsumerWidget {
  const TaskDetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _task = ref.watch(taskListViewController).getTask(id);

    if (_task == null) {
      return const Scaffold(body: Text(''));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () =>
                Routemaster.of(context).push('/tasks/detail/$id/edit'),
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
