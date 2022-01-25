import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Serializer<Task> {
  Map<String, dynamic> toMap(Task data);
  Task fromDoc(DocumentSnapshot doc);
}

class FirestoreCollectionReader<T> {
  FirestoreCollectionReader(this._readRef, this._serializer);

  final Query _readRef;
  final Serializer<T> _serializer;

  Future<List<T>> read() async {
    final snaps = await _readRef.get();
    final datas = snaps.docs.map(_serializer.fromDoc).toList();
    return datas;
  }

  Stream<List<T>> getListener() {
    final listener = _readRef.snapshots().map((snaps) {
      final datas = snaps.docs.map(_serializer.fromDoc).toList();
      return datas;
    });
    return listener;
  }
}

class FirestoreCollectionWriter<T> {
  FirestoreCollectionWriter(this._writeRef, this._serializer);

  final CollectionReference _writeRef;
  final Serializer<T> _serializer;

  Future<void> add(T data) async {
    final map = _serializer.toMap(data);
    await _writeRef.add(map);
    return;
  }
}

class FirestoreDocumentReader<T> {
  FirestoreDocumentReader(this._readRef, this._serializer);

  final DocumentReference _readRef;
  final Serializer<T> _serializer;

  Future<T> read() async {
    final snap = await _readRef.get();
    final data = _serializer.fromDoc(snap);
    return data;
  }

  Stream<T> getListener() {
    final listener = _readRef.snapshots().map((snap) {
      final data = _serializer.fromDoc(snap);
      return data;
    });
    return listener;
  }
}

class FirestoreDocumentWriter<T> {
  FirestoreDocumentWriter(this._writeRef, this._serializer);

  final DocumentReference _writeRef;
  final Serializer<T> _serializer;

  Future<void> update(T data) async {
    final map = _serializer.toMap(data);
    await _writeRef.update(map);
    return;
  }

  Future<void> create(T data) async {
    final map = _serializer.toMap(data);
    await _writeRef.set(map);
    return;
  }
}
