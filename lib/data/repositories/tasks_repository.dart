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
  final uid = 'ylVxe2Pk2ceMnNMEIWj4';
  late final _tasksReadRef =
      _db.collection('tasks').where('uid', isEqualTo: uid);
  late final _tasksWriteRef = _db.collection('tasks');

  // ignore: avoid_void_async
  void listen() async {
    final listner = _tasksReadRef.snapshots();
    await for (final snaps in listner) {
      final tasks = snaps.docs.map((e) => Task.fromDoc(e)).toList();
      tasksStreamController.add(tasks);
    }
  }

  Future<void> create(Task task) async {
    final map = task.toMap(uid);
    await _tasksWriteRef.add(map);
  }

  Future<void> update(Task task) async {
    final id = task.id!;
    final map = task.toMap(uid);
    await _tasksWriteRef.doc(id).update(map);
  }

  Future<void> delete(Task task) async {
    final id = task.id!;
    await _tasksWriteRef.doc(id).delete();
  }

  Future<void> dispose() async {}

  void injection(List<Task> tasks) {
    tasksStreamController.add(tasks);
  }
}
