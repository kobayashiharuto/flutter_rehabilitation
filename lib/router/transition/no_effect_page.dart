import 'package:flutter/material.dart';

class NoEffectPage extends Page<void> {
  const NoEffectPage({required this.child});
  final Widget child;
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      fullscreenDialog: true,
      opaque: false,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
    );
  }
}
