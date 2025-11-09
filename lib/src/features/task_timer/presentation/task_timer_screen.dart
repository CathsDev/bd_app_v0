import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/features/task_timer/presentation/providers/task_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TaskTimerScreen extends ConsumerWidget {
  const TaskTimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final mood = session.mood;
    final mode = session.mode;
    final area = session.area;
    final activity = session.activity;
    final currentTask = session.currentTask;
    final timer = ref.watch(taskTimerProvider);

    if (currentTask == null) {
      return Text('Kein Task ausgewählt!');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Timer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mood, size: 100),
            const SizedBox(height: 20),
            Text(
              'Task Timer Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text('mood: $mood'),
            Text('mode: $mode'),
            Text('area: $area'),
            Text('activity: $activity'),
            Text('currentTask: ${currentTask.task.title}'),
            Text('currentTask: ${timer.totalDuration}'),
          ],
        ),
      ),
    );
  }
}
