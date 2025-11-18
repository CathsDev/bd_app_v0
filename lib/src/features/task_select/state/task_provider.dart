import 'dart:convert';

import 'package:bd_app_v0/src/shared/providers/session_provider.dart';
import 'package:bd_app_v0/src/features/mood_select/domain/mood.dart';
import 'package:bd_app_v0/src/features/task_select/domain/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final taskProvider = FutureProvider<List<TaskWithVariant>>((ref) async {
  /// Session (mood + area/activity)
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final session = ref.watch(sessionProvider);
  final moodId = session.mood;

  // Mood Check
  if (moodId == null) {
    throw Exception('Kein Mood gesetzt - Das sollte nicht passieren!');
  }

  // Von String ID => Mood Objekt => energyLevel
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
  } else if (session.mode == 'activity') {
    // Filter relatedActivities
    filteredTasks = tasks.where((task) {
      return task.relatedActivities.contains(session.activity);
    }).toList();
  } else {
    filteredTasks = [];
  }

  // Cooldown Filtering
  final String? cooldownJson = prefs.getString('completed_tasks');
  Map<String, dynamic> completedTasks = {};

  if (cooldownJson != null) {
    completedTasks = Map<String, dynamic>.from(jsonDecode(cooldownJson));
  }

  // Filter Tasks mit aktivem Cooldown raus
  filteredTasks = filteredTasks.where((task) {
    // Wenn Task nicht completed ist => verfügbar
    if (!completedTasks.containsKey(task.id)) {
      return true;
    }

    // Task wurde completed → check Cooldown
    final completedAtString = completedTasks[task.id];
    final completedAt = DateTime.parse(completedAtString);
    final cooldownEnd = completedAt.add(Duration(days: task.cooldownDays));

    // Wenn Cooldown vorbei => verfügbar
    return cooldownEnd.isBefore(DateTime.now());
  }).toList();

  // Für jeden Task die passende Variant finden
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

  // Todo: Nimm einfach bis zu 3 Tasks für MVP
  return tasksWithVariants.take(3).toList();
});

class TaskWithVariant {
  final Task task;
  final TaskVariant variant;
  TaskWithVariant({required this.task, required this.variant});
}
