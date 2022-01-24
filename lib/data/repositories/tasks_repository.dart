import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_interval/data/entities/task.dart';

class TasksRepository {
  TasksRepository(String uid) {
    final _db = FirebaseFirestore.instance;
    _uid = uid;
    _tasksReadRef = _db.collection('tasks').where('uid', isEqualTo: uid);
    _tasksWriteRef = _db.collection('tasks');
  }

  late final String _uid;
  late final Query _tasksReadRef;
  late final CollectionReference _tasksWriteRef;

  Stream<List<Task>> getListner() {
    final listener = _tasksReadRef.snapshots().map((snaps) {
      final tasks = snaps.docs.map((e) => Task.fromDoc(e)).toList();
      return tasks;
    });
    return listener;
  }

  Future<void> create(Task task) async {
    final map = task.toMap(_uid);
    await _tasksWriteRef.add(map);
  }

  Future<void> update(Task task) async {
    final id = task.id!;
    final map = task.toMap(_uid);
    await _tasksWriteRef.doc(id).update(map);
  }

  Future<void> delete(Task task) async {
    final id = task.id!;
    await _tasksWriteRef.doc(id).delete();
  }

  Future<void> dispose() async {}
}
