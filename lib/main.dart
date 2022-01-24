import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/mocks/task_mock.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/screens/init_loading/init_loading_screen.dart';
import 'package:test_interval/screens/login/login_screen.dart';
import 'package:test_interval/screens/tasks/task_create_screen.dart';
import 'package:test_interval/screens/tasks/task_detail_screen.dart';
import 'package:test_interval/screens/tasks/task_edit_screen.dart';
import 'package:test_interval/screens/tasks/task_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(
    overrides: const [],
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = Provider<GoRouter>(
    (ref) => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'init',
          builder: (_, __) => const InitLoadingScreen(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (_, __) => const LoginScreen(),
        ),
        GoRoute(
          path: '/tasks',
          name: 'tasks',
          builder: (_, __) => const TaskScreen(),
          routes: [
            GoRoute(
              name: 'detail',
              path: 'detail/:id',
              builder: (_, state) => TaskDetailScreen(id: state.params['id']!),
              routes: [
                GoRoute(
                  name: 'edit',
                  path: 'edit/:id',
                  builder: (_, state) =>
                      TaskEditScreen(id: state.params['id']!),
                ),
              ],
            ),
            GoRoute(
              name: 'create',
              path: 'create',
              builder: (_, state) => const TaskCreateScreen(),
            ),
          ],
        ),
      ],
      redirect: (state) {
        final sessionStatus = ref.read(sessionStatusProvider).sessionStatus;
        // 初期ローディング中なら
        if (sessionStatus == null) {
          if (state.subloc == '/') return null;
          return '/';
        }

        // ログアウトならログインに飛ばす
        if (sessionStatus == SessionStatus.logout) {
          if (state.subloc == '/login') return null;
          return '/login';
        }

        // ログイン状態でログイン画面に行こうとしていたらタスクに飛ばす
        if (sessionStatus == SessionStatus.login && state.subloc == '/login') {
          return '/tasks';
        }

        // ログイン状態でルートに行こうとしていたらタスクに飛ばす
        if (sessionStatus == SessionStatus.login && state.subloc == '/') {
          return '/tasks';
        }

        return null;
      },
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(sessionStatusProvider, (_, __) => ref.read(_router).refresh());
    return MaterialApp.router(
      routeInformationParser: ref.watch(_router).routeInformationParser,
      routerDelegate: ref.watch(_router).routerDelegate,
    );
  }
}
