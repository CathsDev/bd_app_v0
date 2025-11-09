// idle: noch nicht gestartet, Button = Play
// running: Tickt, Button = Pause
// paused: Runterzählen pausiert, Button = Play
// finished: Zeit abgelaufen, Button = Fertig (alert)
import 'package:bd_app_v0/src/features/task_timer/presentation/providers/task_timer_provider.dart';

class TaskTimerService {
  const TaskTimerService();

  // Anfangswerte für Timer
  TaskTimerState initializeTimer(int minutes) {
    return TaskTimerState(
      totalDuration: Duration(minutes: minutes),
      remainingTime: Duration(minutes: minutes),
      status: TimerStatus.idle,
    );
  }

  // Startet Timer
  TaskTimerState startTimer(TaskTimerState current) {
    return current.copyWith(status: TimerStatus.running);
  }

  // Pausiert Timer
  TaskTimerState pauseTimer(TaskTimerState current) {
    return current.copyWith(status: TimerStatus.paused);
  }

  // Weiter nach Pause
  TaskTimerState resumeTimer(TaskTimerState current) {
    return current.copyWith(status: TimerStatus.running);
  }

  // Stoppt Timer
  TaskTimerState stopTimer(TaskTimerState current) {
    return current.copyWith(status: TimerStatus.finished);
  }

  // Resettet Timer
  TaskTimerState resetTimer(TaskTimerState current) {
    return current.copyWith(
      remainingTime: current.totalDuration,
      status: TimerStatus.idle,
    );
  }

  // Tick
  TaskTimerState tick(TaskTimerState current) {
    final updatedRemainingTime = current.remainingTime - Duration(seconds: 1);

    if (updatedRemainingTime.inSeconds <= 0) {
      return TaskTimerState(
        totalDuration: current.totalDuration,
        remainingTime: Duration.zero,
        status: TimerStatus.finished,
      );
    } else {
      return current.copyWith(remainingTime: updatedRemainingTime);
    }
  }

  TaskTimerState togglePlayPause(TaskTimerState current) {
    if (current.status == TimerStatus.running) {
      return pauseTimer(current);
    }
    if (current.status == TimerStatus.paused) {
      return resumeTimer(current);
    }
    if (current.status == TimerStatus.idle) {
      return startTimer(current);
    }
    if (current.status == TimerStatus.finished) {
      return current;
    }

    throw Exception('Kein TimerStatus vorhanden!');
  }
}
