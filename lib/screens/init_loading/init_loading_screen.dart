import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/screens/tasks/components/task_cell.dart';
import 'package:go_router/go_router.dart';

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
