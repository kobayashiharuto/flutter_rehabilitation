import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/router/bottom_navigation_bar.dart';
import 'package:test_interval/screens/init_loading/init_loading_screen.dart';
import 'package:test_interval/screens/login/login_screen.dart';
import 'package:test_interval/screens/settings/settings_screen.dart';
import 'package:test_interval/screens/tasks/task_create_screen.dart';
import 'package:test_interval/screens/tasks/task_detail_screen.dart';
import 'package:test_interval/screens/tasks/task_edit_screen.dart';
import 'package:test_interval/screens/tasks/task_screen.dart';
import 'package:test_interval/screens/timeline/timeline_screen.dart';

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = Provider<RouteMap>(
    (ref) {
      final sessionStatus = ref.watch(sessionStatusProvider).sessionStatus;

      if (sessionStatus == null) {
        return RouteMap(
          onUnknownRoute: (_) => const Redirect('/'),
          routes: {
            '/': (_) => const MaterialPage<void>(child: InitLoadingScreen())
          },
        );
      }

      if (sessionStatus == SessionStatus.logout) {
        return RouteMap(
          onUnknownRoute: (_) => const Redirect('/'),
          routes: {'/': (_) => const MaterialPage<void>(child: LoginScreen())},
        );
      }

      return RouteMap(
        routes: {
          '/': (_) => const CupertinoTabPage(
                child: BottomNavScaffold(),
                paths: [
                  'tasks',
                  'timeline',
                  'settings',
                ],
              ),
          '/tasks': (_) => const MaterialPage<void>(child: TaskScreen()),
          '/tasks/create': (_) =>
              const MaterialPage<void>(child: TaskCreateScreen()),
          '/tasks/detail/:id': (info) {
            final id = info.pathParameters['id'];
            if (id == null) {
              return const Redirect('/tasks');
            }
            return MaterialPage<void>(child: TaskDetailScreen(id: id));
          },
          '/tasks/detail/:id/edit': (info) {
            final id = info.pathParameters['id'];
            if (id == null) {
              return const Redirect('/tasks');
            }
            return MaterialPage<void>(child: TaskEditScreen(id: id));
          },
          '/timeline': (_) => const MaterialPage<void>(child: TimelineScreen()),
          '/settings': (_) => const MaterialPage<void>(child: SettingsScreen()),
        },
      );
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
        routeInformationParser: const RoutemasterParser(),
        routerDelegate:
            RoutemasterDelegate(routesBuilder: (_) => ref.watch(_router)));
  }
}
