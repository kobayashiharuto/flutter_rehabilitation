import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

// ステート
@freezed
abstract class Task with _$Task {
  const factory Task({
    String? id,
    required String title,
    required String description,
    required DateTime dealine,
    @Default(false) bool completed,
  }) = _Task;

  const Task._();

  // firebaseから取ってきたsnapshotをもとにインスタンスを返すコンストラクタ
  factory Task.fromDoc(QueryDocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return Task(
      id: doc.id,
      title: data['title'] as String,
      description: data['description'] as String,
      dealine: (data['deadline'] as Timestamp).toDate(),
      completed: data['completed'] as bool,
    );
  }

  // クライアント側からCREATE時
  factory Task.fromClientOnCreate(
      String title, String description, DateTime deadline) {
    return Task(title: title, description: description, dealine: deadline);
  }

  // クライアント側からUPDATE時
  factory Task.fromClientOnUpdate(String id, String title, String description,
      DateTime deadline, bool completed) {
    return Task(
        id: id,
        title: title,
        description: description,
        dealine: deadline,
        completed: completed);
  }

  // データベースへ
  Map<String, dynamic> toMap(String uid) {
    final map = {
      'uid': uid,
      'title': title,
      'description': description,
      'deadline': dealine,
      'completed': false,
    };
    return map;
  }
}
