import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';

part 'task_list_controller.freezed.dart';

// ステート
@freezed
abstract class TaskListViewState with _$TaskListViewState {
  const factory TaskListViewState({
    @Default(true) bool onScreenLoading,
    @Default(<Task>[]) List<Task> tasks,
  }) = _TaskListViewState;
}

// コントローラー
final taskListViewController = StateNotifierProvider.autoDispose<
    TaskListViewController, TaskListViewState>((ref) {
  final uid = ref.watch(sessionStatusProvider).uid!;
  final controller = TaskListViewController(uid);
  ref.onDispose(controller.dispose);
  return controller;
});

class TaskListViewController extends StateNotifier<TaskListViewState> {
  TaskListViewController(String uid)
      : _taskRepo = TasksRepository(uid),
        super(const TaskListViewState()) {
    listen();
  }

  final TasksRepository _taskRepo;
  StreamSubscription<List<Task>>? listener;

  void listen() {
    listener = _taskRepo.getListner().listen((tasks) {
      state = state.copyWith(tasks: tasks, onScreenLoading: false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    listener?.cancel();
  }
}
