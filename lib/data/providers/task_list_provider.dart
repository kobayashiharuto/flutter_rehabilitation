import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';

final taskListProvider = Provider.autoDispose<Stream<List<Task>>?>((ref) {
  final uid = ref.watch(sessionStatusProvider).uid;
  debugPrint('INFO UID LISTEN: ${uid ?? ''}');
  final _taskRepo = uid != null ? TasksRepository(uid) : null;
  final listener = _taskRepo?.getListener();
  return listener;
});
