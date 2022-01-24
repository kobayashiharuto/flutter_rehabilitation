import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/extensions/state_notifier_log.dart';

part 'task_edit_controller.freezed.dart';

// ステート
@freezed
class TaskEditViewState with _$TaskEditViewState {
  const factory TaskEditViewState({
    required bool completed,
    required DateTime dateTime,
  }) = _TaskEditViewState;
}

// コントローラー
final taskEditViewController = StateNotifierProvider.autoDispose
    .family<TaskEditViewController, TaskEditViewState, Task>((ref, task) {
  final uid = ref.watch(sessionStatusProvider).uid!;
  final controller = TaskEditViewController(task, uid);
  return controller;
});

class TaskEditViewController extends StateNotifierWithLog<TaskEditViewState> {
  TaskEditViewController(Task task, String uid)
      : _taskRepo = TasksRepository(uid),
        _id = task.id!,
        super(TaskEditViewState(
            completed: task.completed, dateTime: task.dealine)) {
    state = state.copyWith(completed: task.completed);
    titleController.text = task.title;
    descriptionController.text = task.description;
  }

  final String _id;
  final TasksRepository _taskRepo;

  final titleController = TextEditingController(text: '');
  final titleFocusNode = FocusNode();
  final descriptionController = TextEditingController(text: '');
  final descriptionFocusNode = FocusNode();

  Future<void> update() async {
    final task = Task.fromClientOnUpdate(
      _id,
      titleController.text,
      descriptionController.text,
      state.dateTime,
      state.completed,
    );
    await _taskRepo.update(task);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    titleFocusNode.dispose();
    descriptionController.dispose();
    descriptionFocusNode.dispose();
  }
}
