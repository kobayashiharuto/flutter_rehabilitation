import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class BottomNavScaffold extends HookConsumerWidget {
  const BottomNavScaffold({Key? key}) : super(key: key);

  // 各タブに対応するページ
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = CupertinoTabPage.of(context);

    final _currentIndex = useState(0);

    return CupertinoTabScaffold(
      controller: tabState.controller,
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        activeColor: Colors.black87,
        inactiveColor: Colors.black26,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (index) {
          if (index == _currentIndex.value) {
            switch (index) {
              case 0:
                Routemaster.of(context).push('/tasks');
                break;
              case 1:
                Routemaster.of(context).push('/timeline');
                break;
              case 2:
                Routemaster.of(context).push('/settings');
                break;
              default:
            }
          }
          _currentIndex.value = index;
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return PageStackNavigator(
          key: ValueKey(tabState.page.paths[index]),
          stack: tabState.stacks[index],
        );
      },
    );
  }
}
