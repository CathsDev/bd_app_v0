import 'package:bd_app_v0/src/core/providers/session_provider.dart';
import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:bd_app_v0/src/features/mood_select/models/mood_model.dart';
import 'package:bd_app_v0/src/features/mood_select/presentation/widgets/mood_tile.dart';
import 'package:bd_app_v0/src/features/mood_select/providers/mood_select_provider.dart';
import 'package:bd_app_v0/src/shared/widgets/header/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MoodSelectScreen extends ConsumerWidget {
  const MoodSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMoodId = ref.watch(moodSelectProvider).selectedId;
    final canContinue = selectedMoodId != null;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderImage(
            assetsPath: 'assets/images/header/mood.png',
            showHome: true,
            showBack: true,
          ),
          Semantics(
            header: true,
            label: 'Wie geht es dir heute?',
            hint: 'Wähle deine Stimmung aus',
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Wie geht es dir heute?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                primary: false,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.95, // leicht höher als breit
                children: [
                  for (final mood in moods)
                    MoodTile(
                      mood: mood,
                      selected: mood.id == selectedMoodId,
                      onTap: () {
                        ref
                            .read(moodSelectProvider.notifier)
                            .setSelected(mood.id);
                      },
                      cs: cs,
                    ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Visibility(
              visible: true,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: ElevatedButton(
                  onPressed: canContinue
                      ? () {
                          ref
                              .read(sessionProvider.notifier)
                              .updateMood(selectedMoodId);
                          context.pushNamed(AppRoutes.modeSelect);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.petrol2,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Los geht's",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
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
