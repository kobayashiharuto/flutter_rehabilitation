import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/mocks/task_mock.dart';

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>((ref) {
  final _repository = TasksRepository();
  ref.onDispose(_repository.dispose);
  return TasksRepository();
});

class TasksRepository {
  TasksRepository() {
    listen();
  }

  final tasksStreamController = StreamController<List<Task>>();

  void listen() {
    // tasksStreamController.add();
  }

  void create(Task task) {}

  void update(Task task) {}

  void delete(Task task) {}

  void dispose() {}

  void injection(List<Task> tasks) {
    tasksStreamController.add(tasks);
  }
}
