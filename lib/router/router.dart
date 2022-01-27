import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/router/bottom_navigation_bar.dart';
import 'package:test_interval/router/transition/fade_page.dart';
import 'package:test_interval/router/transition/no_effect_page.dart';
import 'package:test_interval/router/transition/slide_up_page.dart';
import 'package:test_interval/screens/init_loading/init_loading_screen.dart';
import 'package:test_interval/screens/login/login_screen.dart';
import 'package:test_interval/screens/settings/settings_screen.dart';
import 'package:test_interval/screens/tasks/task_create_screen.dart';
import 'package:test_interval/screens/tasks/task_detail_screen.dart';
import 'package:test_interval/screens/tasks/task_edit_screen.dart';
import 'package:test_interval/screens/tasks/task_screen.dart';
import 'package:test_interval/screens/timeline/timeline_screen.dart';

final routerProvider = Provider<RouteMap>(
  (ref) {
    final sessionStatus = ref.watch(sessionStatusProvider).sessionStatus;

    if (sessionStatus == null) {
      return RouteMap(
        onUnknownRoute: (_) => const Redirect('/'),
        routes: {'/': (_) => const NoEffectPage(child: InitLoadingScreen())},
      );
    }

    if (sessionStatus == SessionStatus.logout) {
      return RouteMap(
        onUnknownRoute: (_) => const Redirect('/'),
        routes: {'/': (_) => const NoEffectPage(child: LoginScreen())},
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
        '/tasks': (_) => const NoEffectPage(child: TaskScreen()),
        '/tasks/create': (_) => const SlideUpPage(child: TaskCreateScreen()),
        '/tasks/detail/:id': (info) {
          final id = info.pathParameters['id'];
          if (id == null) {
            return const Redirect('/tasks');
          }
          return CupertinoPage<void>(child: TaskDetailScreen(id: id));
        },
        '/tasks/detail/:id/edit': (info) {
          final id = info.pathParameters['id'];
          if (id == null) {
            return const Redirect('/tasks');
          }
          return FadePage(child: TaskEditScreen(id: id));
        },
        '/timeline': (_) => const NoEffectPage(child: TimelineScreen()),
        '/settings': (_) => const NoEffectPage(child: SettingsScreen()),
      },
    );
  },
);
