import 'dart:async';

import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/features/task_timer/services/task_timer_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// idle: noch nicht gestartet, Button = Play
// running: Tickt, Button = Pause
// paused: Runterzählen pausiert, Button = Play
// finished: Zeit abgelaufen, Button = Fertig (alert)
enum TimerStatus { idle, running, paused, finished }

// totalDuration: Gesamtzeit der Task
// remainingTime: Restzeit
// accumulatedTime: verstrichene Zeit
// statur: TimerStatus (enum)

class TaskTimerState {
  final Duration totalDuration;
  final Duration remainingTime;
  final TimerStatus status;

  const TaskTimerState({
    required this.totalDuration,
    required this.remainingTime,
    required this.status,
  });

  // Alles wieder auf 0
  factory TaskTimerState.initial() {
    return const TaskTimerState(
      totalDuration: Duration.zero,
      remainingTime: Duration.zero,
      status: TimerStatus.idle,
    );
  }

  TaskTimerState copyWith({
    Duration? totalDuration,
    Duration? remainingTime,
    TimerStatus? status,
  }) {
    return TaskTimerState(
      totalDuration: totalDuration ?? this.totalDuration,
      remainingTime: remainingTime ?? this.remainingTime,
      status: status ?? this.status,
    );
  }

  bool get isIdle => status == TimerStatus.idle;
  bool get isRunning => status == TimerStatus.running;
  bool get isPaused => status == TimerStatus.paused;
  bool get isFinished => status == TimerStatus.finished;
}

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

final taskTimerProvider = NotifierProvider<TaskTimerNotifier, TaskTimerState>(
  () {
    return TaskTimerNotifier();
  },
);
