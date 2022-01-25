import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_interval/utils/tools/firestore_crud.dart';

part 'task.freezed.dart';

// ステート
@freezed
class Task with _$Task {
  const factory Task({
    String? id,
    required String uid,
    required String title,
    required String description,
    required DateTime dealine,
    @Default(false) bool completed,
  }) = _Task;

  const Task._();

  // firebaseから取ってきたsnapshotをもとにインスタンスを返すコンストラクタ
  factory Task.fromDoc(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return Task(
      id: doc.id,
      uid: doc['uid'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
      dealine: (data['deadline'] as Timestamp).toDate(),
      completed: data['completed'] as bool,
    );
  }

  // クライアント側からCREATE時
  factory Task.fromClientOnCreate(
      String uid, String title, String description, DateTime deadline) {
    return Task(
        title: title, uid: uid, description: description, dealine: deadline);
  }

  // クライアント側からUPDATE時
  factory Task.fromClientOnUpdate(String id, String uid, String title,
      String description, DateTime deadline, bool completed) {
    return Task(
        id: id,
        uid: uid,
        title: title,
        description: description,
        dealine: deadline,
        completed: completed);
  }

  // データベースへの書き込み時
  Map<String, dynamic> toMap() {
    final map = {
      'uid': uid,
      'title': title,
      'description': description,
      'deadline': dealine,
      'completed': completed,
    };
    return map;
  }
}

class TaskSerializer extends Serializer<Task> {
  @override
  Map<String, dynamic> toMap(Task data) => data.toMap();
  @override
  Task fromDoc(DocumentSnapshot doc) => Task.fromDoc(doc);
}
