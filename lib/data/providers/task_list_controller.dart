import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/extensions/state_notifier_log.dart';

part 'task_list_controller.freezed.dart';

// ステート
@freezed
class TaskListViewState with _$TaskListViewState {
  const factory TaskListViewState({
    @Default(true) bool onScreenLoading,
    @Default(<Task>[]) List<Task> tasks,
  }) = _TaskListViewState;

  const TaskListViewState._();

  Task? getTask(String id) {
    return tasks.firstWhereOrNull((item) => item.id == id);
  }
}

// コントローラー
final taskListViewController = StateNotifierProvider.autoDispose<
    TaskListViewController, TaskListViewState>((ref) {
  final uid = ref.watch(sessionStatusProvider).uid!;
  final controller = TaskListViewController(uid);
  return controller;
});

class TaskListViewController extends StateNotifierWithLog<TaskListViewState> {
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
