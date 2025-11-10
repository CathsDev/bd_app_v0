import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/core/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/task_timer/providers/task_timer_provider.dart';
import 'package:bd_app_v0/src/shared/widgets/header/timer_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskTimerScreen extends ConsumerWidget {
  const TaskTimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final currentTask = session.currentTask;
    final timer = ref.watch(taskTimerProvider);

    final play = timer.isIdle || timer.isPaused || timer.isFinished;

    if (currentTask == null) {
      return Text('Kein Task ausgewählt!');
    }

    final description = currentTask.variant.description;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimerHeader(),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              currentTask.task.title,
              style: TextStyles.textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(description),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Center(
                child: SizedBox(
                  height: 80,
                  width: 220,
                  child: FilledButton(
                    onPressed: () {
                      ref.read(taskTimerProvider.notifier).togglePlayPause();
                    },
                    child: Icon(play ? Icons.play_arrow : Icons.pause),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
