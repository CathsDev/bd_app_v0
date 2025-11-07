import 'package:bd_app_v0/src/core/constants/assets.dart';
import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/core/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/task_select/presentation/widgets/task_card.dart';
import 'package:bd_app_v0/src/features/task_select/providers/task_provider.dart';
import 'package:bd_app_v0/src/shared/widgets/header/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskSelectScreen extends ConsumerWidget {
  const TaskSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final tasksProvider = ref.watch(taskProvider);
    final tasks = tasksProvider.getTasksForSession();
    /* final mood = session.mood;
    final mode = session.mode;
    final area = session.area;
    final activity = session.activity; */
    var headerImage = AssetsPath.defaultImage;
    if (session.mode == 'activity') {
      headerImage = AssetsPath.focus;
    }
    if (session.mode == 'area') {
      headerImage = AssetsPath.mode;
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderImage(assetsPath: headerImage, showHome: true, showBack: true),
          Semantics(
            header: true,
            label: 'Wähle eine Aufgabe',
            hint: 'Wähle aus drei vorgeschlagenen Aufgaben',
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Wähle eine Aufgabe?',
                style: TextStyles.textTheme.headlineLarge,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                // Tasks
                ...tasks.map(
                  (taskWithVariant) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: TaskCard(
                          title: taskWithVariant.task.category,
                          description: taskWithVariant.task.title,
                          timeTip: '${taskWithVariant.variant.timeMinutes}',
                          onTap: () {},
                          selected: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
