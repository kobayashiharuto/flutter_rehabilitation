import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InitLoadingScreen extends HookConsumerWidget {
  const InitLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
      ),
      body: const Center(
        child: Text('なう ろーでぃんぐ!'),
      ),
    );
  }
}
