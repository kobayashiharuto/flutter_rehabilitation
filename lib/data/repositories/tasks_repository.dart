import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/utils/tools/firestore_crud.dart';

class TaskCollectionRepository {
  TaskCollectionRepository({required String userID}) {
    final readRef = FirebaseFirestore.instance
        .collection('tasks')
        .where('uid', isEqualTo: userID);
    final writeRef = FirebaseFirestore.instance.collection('tasks');
    final serializer = TaskSerializer();
    reader = FirestoreCollectionReader(readRef, serializer);
    writer = FirestoreCollectionWriter(writeRef, serializer);
  }

  late final FirestoreCollectionReader<Task> reader;
  late final FirestoreCollectionWriter<Task> writer;
}

class TaskDocumentRepository {
  TaskDocumentRepository({required String taskID}) {
    final ref = FirebaseFirestore.instance.collection('tasks').doc(taskID);
    final serializer = TaskSerializer();
    reader = FirestoreDocumentReader(ref, serializer);
    writer = FirestoreDocumentWriter(ref, serializer);
  }

  late final FirestoreDocumentReader<Task> reader;
  late final FirestoreDocumentWriter<Task> writer;
}
