import 'package:bd_app_v0/src/features/task_select/state/task_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionState {
  final String? mood;
  final String? mode;
  final String? area;
  final String? activity;
  final DateTime? startTime;
  final TaskWithVariant? currentTask;

  SessionState({
    this.mood,
    this.mode,
    this.area,
    this.activity,
    this.startTime,
    this.currentTask,
  });

  factory SessionState.initial() {
    return SessionState(
      mood: null,
      mode: null,
      area: null,
      activity: null,
      startTime: null,
      currentTask: null,
    );
  }

  SessionState copyWith({
    String? mood,
    String? mode,
    String? area,
    String? activity,
    DateTime? startTime,
    TaskWithVariant? currentTask,
  }) {
    return SessionState(
      mood: mood ?? this.mood,
      mode: mode ?? this.mode,
      area: area ?? this.area,
      activity: activity ?? this.activity,
      startTime: startTime ?? this.startTime,
      currentTask: currentTask ?? this.currentTask,
    );
  }

  factory SessionState.fromJson(Map<String, dynamic> json) {
    return SessionState(
      mood: json['mood'] as String,
      mode: json['mode'] as String,
      area: json['area'] as String,
      activity: json['activity'] as String,
      startTime: json['startTime'] != null
          ? DateTime.parse(json['startTime'] as String)
          : null,
      currentTask: json['currentTask'] as TaskWithVariant,
    );
  }

  Map<String, dynamic> toJson() => {
    'mood': mood,
    'mode': mode,
    'area': area,
    'activity': activity,
    'startTime': startTime?.toIso8601String(),
    'currentTask': currentTask,
  };
}

class SessionNotifier extends Notifier<SessionState> {
  @override
  SessionState build() => SessionState.initial();

  // Mood setzen
  void updateMood(String mood) {
    state = state.copyWith(
      mood: mood,
      startTime: state.startTime ?? DateTime.now(),
    );
  }

  // Mode setzen
  void updateMode(String mode) {
    state = state.copyWith(mode: mode);
  }

  // Area setzen
  void updateArea(String area) {
    state = state.copyWith(area: area);
  }

  // Activity setzen
  void updateActivity(String activity) {
    state = state.copyWith(activity: activity);
  }

  // CurrentTask setzen
  void updateCurrentTask(TaskWithVariant task) {
    state = state.copyWith(currentTask: task);
  }

  // Alles zurücksetzen
  void clear() {
    state = SessionState.initial();
  }

  void clearCurrentTask() {
    state = SessionState(
      mood: state.mood,
      mode: state.mode,
      area: state.area,
      activity: state.activity,
      startTime: state.startTime,
      currentTask: null,
    );
  }
}

// Provider
final sessionProvider = NotifierProvider<SessionNotifier, SessionState>(
  SessionNotifier.new,
);
