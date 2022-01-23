import 'package:flutter/foundation.dart';

@immutable
class Task {
  const Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.completed});

  final String id;
  final String title;
  final String description;
  final bool completed;

  Task copyWith(
      {String? id, String? title, String? description, bool? completed}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
