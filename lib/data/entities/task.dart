import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

// ステート
@freezed
abstract class Task with _$Task {
  const factory Task({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool completed,
  }) = _Task;
}
