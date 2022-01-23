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
      completed: data['completed'] as bool,
    );
  }

  // クライアント側からCREATE時
  factory Task.fromClientOnCreate(String title, String description) {
    return Task(title: title, description: description);
  }

  // クライアント側からUPDATE時
  factory Task.fromClientOnUpdate(
      String id, String title, String description, bool completed) {
    return Task(
        id: id, title: title, description: description, completed: completed);
  }

  // データベースへ
  Map<String, dynamic> toMap(String uid) {
    final map = {
      'uid': uid,
      'title': title,
      'description': description,
      'completed': false,
    };
    return map;
  }
}
