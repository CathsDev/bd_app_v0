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

    if (session.area != null) {
      // User hat AREA gewählt → Filter nach relatedAreas
      filteredTasks = tasks.where((task) {
        return task.relatedAreas.contains(session.area);
      }).toList();
    } else {
      // User hat ACTIVITY gewählt → Filter nach relatedActivities
      filteredTasks = tasks.where((task) {
        return task.relatedActivities.contains(session.activity);
      }).toList();
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

    // Gruppiere nach Kategorie und wähle je 1 aus
    final result = <TaskWithVariant>[];

    // 1x Cleaning Task
    try {
      final cleaningTask = tasksWithVariants.firstWhere(
        (t) => t.task.category == TaskCategories.cleaning,
      );
      result.add(cleaningTask);
    } catch (e) {
      // Keine cleaning task gefunden - okay, weiter
    }

    // 1x Organizing Task
    try {
      final organizingTask = tasksWithVariants.firstWhere(
        (t) => t.task.category == TaskCategories.organize,
      );
      result.add(organizingTask);
    } catch (e) {
      // Keine organizing task gefunden - okay, weiter
    }

    // 1x Declutter Task
    try {
      final declutterTask = tasksWithVariants.firstWhere(
        (t) => t.task.category == TaskCategories.declutter,
      );
      result.add(declutterTask);
    } catch (e) {
      // Keine declutter task gefunden - okay, weiter
    }

    return result;
  }
}
