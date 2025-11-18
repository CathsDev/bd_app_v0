// idle: noch nicht gestartet, Button = Play
// running: Tickt, Button = Pause
// paused: Runterzählen pausiert, Button = Play
// finished: Zeit abgelaufen, Button = Fertig (alert)
import 'dart:async';

import 'package:bd_app_v0/src/features/task_timer/application/task_timer_service.dart';
import 'package:bd_app_v0/src/features/task_timer/state/task_timer_state.dart';
import 'package:bd_app_v0/src/shared/providers/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TimerStatus { idle, running, paused, finished }

class TaskTimerNotifier extends Notifier<TaskTimerState> {
  Timer? _timer;
  late final _timerService = TaskTimerService();

  TaskTimerNotifier();
  @override
  TaskTimerState build() {
    final session = ref.watch(sessionProvider);
    final currentTask = session.currentTask;
    final timeMinutes = currentTask?.variant.timeMinutes ?? 0;

    ref.onDispose(() {
      _timer?.cancel();
    });

    return _timerService.initializeTimer(timeMinutes);
  }

  void start() {
    state = _timerService.startTimer(state);
    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    state = _timerService.tick(state);
    if (state.isFinished) {
      _timer?.cancel();
    }
  }

  void pause() {
    _timer?.cancel();
    state = _timerService.pauseTimer(state);
  }

  void resume() {
    state = _timerService.resumeTimer(state);
    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void complete() {
    _timer?.cancel();
    state = _timerService.stopTimer(state);
  }

  void reset() {
    _timer?.cancel();
    state = _timerService.resetTimer(state);
  }

  void togglePlayPause() {
    state = _timerService.togglePlayPause(state);
    if (state.isRunning) {
      _timer = Timer.periodic(Duration(seconds: 1), _onTick);
    }
    if (state.isPaused) {
      _timer?.cancel();
    }
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
