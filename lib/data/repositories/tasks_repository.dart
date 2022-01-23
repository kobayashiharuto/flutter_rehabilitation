import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/mocks/task_mock.dart';
import 'package:test_interval/data/providers/tasks_provider.dart';

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>((ref) {
  final _repository = TasksRepository(ref);
  ref.onDispose(_repository.dispose);
  return _repository;
});

class TasksRepository {
  TasksRepository(this.ref) {
    listen();
  }

  Ref ref;

  final tasksStreamController = StreamController<List<Task>>();

  void listen() {
    // tasksStreamController.add();
    injection(mockTasks);
  }

  void create(Task task) {
    final tasks = ref.read(tasksProvider)..add(task);
    tasksStreamController.add(tasks);
  }

  void update(Task task) {
    final tasks = ref.read(tasksProvider);
    final index = tasks.indexWhere((e) => e.id == task.id);
    tasks[index] = task;
    tasksStreamController.add(tasks);
  }

  void delete(Task task) {
    final tasks = ref.read(tasksProvider)..removeWhere((e) => e.id == task.id);
    tasksStreamController.add(tasks);
  }

  void dispose() {}

  void injection(List<Task> tasks) {
    tasksStreamController.add(tasks);
  }
}
