import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';

part 'task_controller.freezed.dart';

// ステート
@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState({
    @Default('') String title,
    @Default('') String description,
  }) = _TaskState;
}

// コントローラー
final taskCreateController =
    StateNotifierProvider.autoDispose((ref) => TaskCreateController(ref));

class TaskCreateController extends StateNotifier<TaskState> {
  TaskCreateController(this.ref) : super(const TaskState()) {
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

  final titleController = TextEditingController(text: '');
  final titleFocusNode = FocusNode();
  final descriptionController = TextEditingController(text: '');
  final descriptionFocusNode = FocusNode();

  void submit() {
    final id = Random().nextInt(10000).toString();
    final task = Task(
        id: id,
        title: titleController.text,
        description: descriptionController.text,
        completed: false);
    _taskRepo.create(task);
  }
}
