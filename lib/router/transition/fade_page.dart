import 'package:flutter/material.dart';

class FadePage extends Page<void> {
  const FadePage({required this.child});
  final Widget child;
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      fullscreenDialog: true,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final _tween = Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: Curves.ease));

        return FadeTransition(
          opacity: animation.drive(_tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
