import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/mocks/task_mock.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/screens/tasks/task_screen.dart';

void main() {
  final _taskRepository = TasksRepository();
  // ignore: cascade_invocations
  _taskRepository.injection(mockTasks);

  runApp(ProviderScope(
    overrides: [tasksRepositoryProvider.overrideWithValue(_taskRepository)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: TaskScreen(),
    );
  }
}
