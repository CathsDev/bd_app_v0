import 'package:bd_app_v0/src/core/models/session_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  // Alles zurücksetzen
  void resetSession() {
    state = SessionState.initial();
  }
}

// Provider
final sessionProvider = NotifierProvider<SessionNotifier, SessionState>(
  SessionNotifier.new,
);
