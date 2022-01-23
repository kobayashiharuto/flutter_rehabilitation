import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/providers/tasks_provider.dart';

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>((ref) {
  final _repository = TasksRepository();
  ref.onDispose(_repository.dispose);
  return _repository;
});

class TasksRepository {
  TasksRepository() {
    listen();
  }

  final tasksStreamController = StreamController<List<Task>>();
  final _db = FirebaseFirestore.instance;
  late final _tasksRef =
      _db.collection('tasks').doc('ylVxe2Pk2ceMnNMEIWj4').collection('tasks');

  // ignore: avoid_void_async
  void listen() async {
    final listner = _tasksRef.snapshots();
    await for (final snaps in listner) {
      final tasks = snaps.docs.map((e) => Task.fromDoc(e)).toList();
      tasksStreamController.add(tasks);
    }
  }

  void create(Task task) {}

  void update(Task task) {}

  void delete(Task task) {}

  void dispose() {}

  void injection(List<Task> tasks) {
    tasksStreamController.add(tasks);
  }
}
