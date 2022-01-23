import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/providers/tasks_provider.dart';
import 'package:test_interval/screens/tasks/components/task_cell.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
      ),
      body: Column(
        children: [
          const Text('ログインしましょう'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth.instance.signInAnonymously();
            },
            child: const Text('ログイン'),
          ),
        ],
      ),
    );
  }
}
