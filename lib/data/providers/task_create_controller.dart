import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';
import 'package:test_interval/utils/extensions/state_notifier_log.dart';

part 'task_create_controller.freezed.dart';

// ステート
@freezed
class TaskCreateViewState with _$TaskCreateViewState {
  const factory TaskCreateViewState({
    @Default('') String title,
    @Default('') String description,
  }) = _TaskCreateViewState;
}

// コントローラー
final taskCreateViewController = StateNotifierProvider.autoDispose<
    TaskCreateViewController, TaskCreateViewState>((ref) {
  final uid = ref.watch(sessionStatusProvider).uid!;
  final controller = TaskCreateViewController(uid);
  return controller;
});

class TaskCreateViewController
    extends StateNotifierWithLog<TaskCreateViewState> {
  TaskCreateViewController(String uid)
      : _taskRepo = TasksRepository(uid),
        super(const TaskCreateViewState());

  final TasksRepository _taskRepo;

  final titleController = TextEditingController(text: '');
  final titleFocusNode = FocusNode();
  final descriptionController = TextEditingController(text: '');
  final descriptionFocusNode = FocusNode();

  void submit() {
    final task = Task.fromClientOnCreate(
        titleController.text, descriptionController.text, DateTime.now());
    _taskRepo.create(task);
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
