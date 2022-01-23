import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/mocks/task_mock.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/screens/tasks/task_create_screen.dart';
import 'package:test_interval/screens/tasks/task_detail_screen.dart';
import 'package:test_interval/screens/tasks/task_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final _taskRepository = TasksRepository();
  // ignore: cascade_invocations
  _taskRepository.injection(mockTasks);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        name: 'tasks',
        builder: (_, __) => const TaskScreen(),
        routes: [
          GoRoute(
            name: 'detail',
            path: 'detail/:id',
            builder: (_, state) => TaskDetailScreen(id: state.params['id']!),
          ),
          GoRoute(
            name: 'create',
            path: 'create',
            builder: (_, state) => const TaskCreateScreen(),
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
