import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';

class TaskCell extends HookConsumerWidget {
  const TaskCell({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Text(task.title),
    ));
  }
}
