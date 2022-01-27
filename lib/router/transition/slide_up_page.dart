import 'package:flutter/material.dart';

class SlideUpPage extends Page<void> {
  const SlideUpPage({required this.child});
  final Widget child;
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      fullscreenDialog: true,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final _tween =
            Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .chain(CurveTween(curve: Curves.ease));

        return SlideTransition(
          position: animation.drive(_tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
