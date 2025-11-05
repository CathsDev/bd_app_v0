import 'package:bd_app_v0/src/core/constants/assets.dart';
import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/core/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/activity_select/models/activity_model.dart';
import 'package:bd_app_v0/src/features/activity_select/providers/activity_select_provider.dart';
import 'package:bd_app_v0/src/shared/widgets/cards/select_card.dart';
import 'package:bd_app_v0/src/shared/widgets/header/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActivitySelectScreen extends ConsumerWidget {
  const ActivitySelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(activitySelectProvider).selectedId;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderImage(
            assetsPath: AssetsPath.activity,
            showBack: true,
            showHome: true,
          ),
          Semantics(
            header: true,
            label: 'Tätigkeit',
            hint: 'Tätigkeit auswählen',
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Welcher Tätigkeit hat Priorität?',
                style: TextStyles.textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return SelectCard(
                  title: activity.title,
                  imagePath: activity.imagePath,
                  selected: activity.id == selectedId,
                  onTap: () {
                    ref
                        .read(activitySelectProvider.notifier)
                        .setSelected(activity.id);
                    ref
                        .read(sessionProvider.notifier)
                        .updateActivity(activity.id);
                    context.pushNamed(AppRoutes.taskSelect);
                  },
                );
              },
              separatorBuilder: (_, _) => const SizedBox.shrink(),
              itemCount: activities.length,
            ),
          ),
        ],
      ),
    );
  }
}
