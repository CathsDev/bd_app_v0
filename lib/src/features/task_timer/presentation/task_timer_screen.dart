import 'dart:convert';
import 'dart:ui';

import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:bd_app_v0/src/core/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/task_timer/providers/task_timer_provider.dart';
import 'package:bd_app_v0/src/shared/widgets/header/timer_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Column(
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
                          ref
                              .read(taskTimerProvider.notifier)
                              .togglePlayPause();
                        },
                        child: Icon(
                          play ? Icons.play_arrow : Icons.pause,
                          size: 54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (timer.isFinished)
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    color: ColorPalette.petrol0.withValues(alpha: 0.50),
                    child: Center(
                      child: Card(
                        color: scheme.primary,
                        margin: EdgeInsets.all(24),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Super!', style: TextStyles.appTitle),
                              SizedBox(height: 32),
                              Text(
                                'Egal wie viel du geschafft hast – du bist hier und das ist stark.',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Jeder Schritt zählt. Wirklich. Auch kleine Schritte bringen dich voran.',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Es geht nicht darum, perfekt zu sein, sondern dranzubleiben.',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Möchtest du eine neue Aufgabe angehen?',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 32),
                              SizedBox(
                                height: 56,
                                width: 220,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: scheme.secondary,
                                  ),
                                  onPressed: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    final String? jsonString = prefs.getString(
                                      'completed_tasks',
                                    );
                                    Map<String, String> completedTasks = {};
                                    if (jsonString != null) {
                                      completedTasks = Map<String, String>.from(
                                        jsonDecode(jsonString),
                                      );
                                    }
                                    completedTasks[currentTask.task.id] =
                                        DateTime.now().toIso8601String();

                                    prefs.setString(
                                      'completed_tasks',
                                      jsonEncode(completedTasks),
                                    );
                                    debugPrint('Saved: $completedTasks');
                                    if (!context.mounted) return;
                                    context.goNamed(AppRoutes.moodSelect);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Weiter'),
                                      SizedBox(width: 8),
                                      Icon(Icons.thumb_up_alt_outlined),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
