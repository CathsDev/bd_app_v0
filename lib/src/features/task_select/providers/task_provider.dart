import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/features/mood_select/models/mood_model.dart';
import 'package:bd_app_v0/src/features/task_select/models/task_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskWithVariant {
  final Task task;
  final TaskVariant variant;
  TaskWithVariant({required this.task, required this.variant});
}

final taskProvider = Provider<TaskService>((ref) {
  return TaskService(ref);
});

class TaskService {
  final Ref ref;

  TaskService(this.ref);

  /// Basierend auf Session (mood + area/activity)
  List<TaskWithVariant> getTasksForSession() {
    final session = ref.read(sessionProvider);
    final moodId = session.mood;

    // Mood Check
    if (moodId == null) {
      throw Exception('Kein Mood gesetzt - Das sollte nicht passieren!');
    }

    // Von String ID → Mood Objekt → energyLevel
    final energy = moods.firstWhere((m) => m.id == moodId).energyLevel;

    // Area/Activity Check
    if (session.area == null && session.activity == null) {
      return []; // Oder Exception? Sollte nicht passieren wegen Router Guards
    }

    // Tasks filtern
    List<Task> filteredTasks;

    if (session.mode == 'area') {
      // User hat AREA gewählt → Filter nach relatedAreas
      filteredTasks = tasks.where((task) {
        return task.relatedAreas.contains(session.area);
      }).toList();
    } else if (session.mode == 'activity') {
      // User hat ACTIVITY gewählt → Filter nach relatedActivities
      filteredTasks = tasks.where((task) {
        return task.relatedActivities.contains(session.activity);
      }).toList();
    } else {
      filteredTasks = [];
    }

    // Für jeden Task die passende Variant finden
    final tasksWithVariants = filteredTasks
        .map((task) {
          try {
            // Finde Variant mit passendem energyLevel
            final variant = task.variants.firstWhere(
              (v) => v.energyLevel == energy,
            );
            return TaskWithVariant(task: task, variant: variant);
          } catch (e) {
            // Falls keine passende Variant gefunden → null zurück
            return null;
          }
        })
        .whereType<TaskWithVariant>()
        .toList(); // Filter null values raus

    // Nimm einfach bis zu 3 Tasks (Quick Fix für MVP)
    return tasksWithVariants.take(3).toList();
  }
}
