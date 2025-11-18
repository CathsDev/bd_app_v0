import 'package:bd_app_v0/src/features/task_timer/state/task_timer_controller.dart';
import 'package:bd_app_v0/src/features/task_timer/state/task_timer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskTimerProvider = NotifierProvider<TaskTimerNotifier, TaskTimerState>(
  () {
    return TaskTimerNotifier();
  },
);
