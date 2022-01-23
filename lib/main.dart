import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/mocks/task_mock.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/screens/tasks/task_detail_screen.dart';
import 'package:test_interval/screens/tasks/task_screen.dart';

void main() {
  // final _taskRepository = TasksRepository();
  // ignore: cascade_invocations
  // _taskRepository.injection(mockTasks);

  runApp(ProviderScope(
    // overrides: [tasksRepositoryProvider.overrideWithValue(_taskRepository)],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/tasks',
    routes: [
      GoRoute(
        path: '/tasks',
        builder: (_, __) => const TaskScreen(),
        routes: [
          GoRoute(
            name: 'detail',
            path: 'detail/:id',
            builder: (_, state) => TaskDetailScreen(id: state.params['id']!),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate);
}
