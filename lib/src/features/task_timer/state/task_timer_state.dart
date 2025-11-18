import 'package:bd_app_v0/src/features/task_timer/state/task_timer_controller.dart';

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
