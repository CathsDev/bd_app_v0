import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/features/task_select/models/task_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskWithVariant {
  final TaskModel task;
  final TaskVariant variant;
  TaskWithVariant({required this.task, required this.variant});
}

final taskProvider = Provider<TaskService>((ref) {
  return TaskService(ref);
});

class TaskService {
  final Ref ref;
  TaskService(this.ref);
  List<TaskWithVariant> getTasksForSession() {
    final session = ref.read(sessionProvider);
    if (session.mood == null) {
      return [];
    }

    return [];
  }
}
