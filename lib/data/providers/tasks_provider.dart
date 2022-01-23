import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';

final tasksWatcher = StreamProvider.autoDispose<List<Task>>((ref) {
  final _repository = ref.watch(tasksRepositoryProvider);
  return _repository.tasksStreamController.stream;
});

final tasksProvider = Provider.autoDispose<List<Task>>((ref) {
  final _watcher = ref.watch(tasksWatcher);
  return _watcher.asData?.value ?? [];
});
