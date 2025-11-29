import 'dart:convert';

import 'package:bd_app_v0/src/features/auth/state/auth_provider.dart';
import 'package:bd_app_v0/src/shared/providers/session_provider.dart';
import 'package:bd_app_v0/src/features/mood_select/domain/mood.dart';
import 'package:bd_app_v0/src/features/task_select/domain/task.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = FutureProvider<List<TaskWithVariant>>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final user = ref.watch(currentUserProvider);

  if (user == null) {
    throw Exception('Kein User gefunden');
  }

  final kCompletedTaskKey = 'users_${user.id}_completed_tasks';

  final session = ref.watch(sessionProvider);
  final moodId = session.mood;

  final activeAreas = await ref.watch(allActiveUserAreasProvider.future);
  final activeAreasIds = activeAreas.map((area) => area.id).toList();

  // Mood Check
  if (moodId == null) {
    throw Exception('Kein Mood gesetzt - Das sollte nicht passieren!');
  }

  // Mood Objekt => energyLevel
  final energy = moods.firstWhere((mood) => mood.id == moodId).energyLevel;

  // Area/Activity Check
  if (session.area == null && session.activity == null) {
    return []; // Oder Exception
  }

  // Tasks filtern
  List<Task> filteredTasks;

  if (session.mode == 'area') {
    // Filter relatedAreas
    filteredTasks = tasks.where((task) {
      return task.relatedAreas.contains(session.area);
    }).toList();
    filteredTasks = filteredTasks.where((task) {
      return task.relatedAreas.any((areaId) => activeAreasIds.contains(areaId));
    }).toList();
  } else if (session.mode == 'activity') {
    // Filter relatedActivities
    filteredTasks = tasks.where((task) {
      return task.relatedActivities.contains(session.activity);
    }).toList();
  } else {
    filteredTasks = [];
  }

  // Cooldown Filtering
  final String? cooldownJson = prefs.getString(kCompletedTaskKey);
  Map<String, dynamic> completedTasks = {};

  if (cooldownJson != null) {
    completedTasks = Map<String, dynamic>.from(jsonDecode(cooldownJson));
  }

  // Filtert Tasks mit aktivem Cooldown raus
  filteredTasks = filteredTasks.where((task) {
    // Wenn Task nicht completed ist => verfügbar
    if (!completedTasks.containsKey(task.id)) {
      return true;
    }

    // Task completed => check Cooldown
    final completedAtString = completedTasks[task.id];
    final completedAt = DateTime.parse(completedAtString);
    final cooldownEnd = completedAt.add(Duration(days: task.cooldownDays));

    // Cooldown vorbei => verfügbar
    return cooldownEnd.isBefore(DateTime.now());
  }).toList();

  // Task für Variante finden
  final tasksWithVariants = filteredTasks
      .map((task) {
        try {
          final variant = task.variants.firstWhere(
            (v) => v.energyLevel == energy,
          );
          return TaskWithVariant(task: task, variant: variant);
        } catch (e) {
          return null;
        }
      })
      .whereType<TaskWithVariant>()
      .toList();

  // Todo: 3 Tasks für MVP
  return tasksWithVariants.take(3).toList();
});

class TaskWithVariant {
  final Task task;
  final TaskVariant variant;
  TaskWithVariant({required this.task, required this.variant});
}
