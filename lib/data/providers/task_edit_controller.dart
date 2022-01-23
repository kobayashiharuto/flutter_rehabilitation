import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';

part 'task_edit_controller.freezed.dart';

// ステート
@freezed
abstract class TaskEditState with _$TaskEditState {
  const factory TaskEditState({
    bool? completed,
  }) = _TaskEditState;
}

// コントローラー
final taskEditController =
    StateNotifierProvider.autoDispose((ref) => TaskEditController(ref));

class TaskEditController extends StateNotifier<TaskEditState> {
  TaskEditController(this.ref) : super(const TaskEditState()) {
    _taskRepo = ref.read(tasksRepositoryProvider);
    ref.onDispose(() {
      titleController.dispose();
      titleFocusNode.dispose();
      descriptionController.dispose();
      descriptionFocusNode.dispose();
    });
  }

  final Ref ref;
  late final TasksRepository _taskRepo;

  String id = '';

  final titleController = TextEditingController(text: '');
  final titleFocusNode = FocusNode();
  final descriptionController = TextEditingController(text: '');
  final descriptionFocusNode = FocusNode();

  void attach(Task task) {
    id = task.id!;
    state = state.copyWith(completed: task.completed);
    titleController.text = task.title;
    descriptionController.text = task.description;
  }

  void update() {
    final task = Task.fromClientOnUpdate(
      id,
      titleController.text,
      descriptionController.text,
      state.completed!,
    );
    _taskRepo.update(task);
  }
}
