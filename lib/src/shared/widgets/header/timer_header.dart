import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/activity_select/state/activity_select_provider.dart';
import 'package:bd_app_v0/src/features/area_select/state/area_select_provider.dart';
import 'package:bd_app_v0/src/features/mode_select/state/mode_select_provider.dart';
import 'package:bd_app_v0/src/features/mood_select/state/mood_select_provider.dart';
import 'package:bd_app_v0/src/features/task_timer/state/task_timer_controller.dart';
import 'package:bd_app_v0/src/features/task_timer/state/task_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TimerHeader extends ConsumerWidget {
  // rechter Home Icon Button
  final bool showHome;
  final IconData homeIcon;
  final String homeTooltip;

  // linker Back Icon Button
  final bool showBack;
  final IconData backIcon;
  final String backTooltip;
  const TimerHeader({
    super.key,
    this.showHome = false,
    this.homeIcon = Icons.home,
    this.homeTooltip = 'Startseite',
    this.showBack = false,
    this.backIcon = Icons.arrow_back,
    this.backTooltip = 'Zurück',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Header Höhe
    final mq = MediaQuery.of(context);
    final screenHeight = mq.size.height;
    final headerHeight = screenHeight * 0.39;

    // Abstände
    final double paddingTop = 8.0;
    final double paddingSide = 12.0;

    final scheme = Theme.of(context).colorScheme;

    final timer = ref.watch(taskTimerProvider);
    final countdown = timer.remainingTime;
    final countdownFormated = TaskTimerNotifier.formatDuration(countdown);

    return SizedBox(
      height: headerHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: Text(countdownFormated, style: TextStyles.timeText)),
          PositionedDirectional(
            top: 0,
            start: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: paddingTop,
                  start: paddingSide,
                ),
                child: Material(
                  color: scheme.secondary,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: Semantics(
                    button: true,
                    label: backTooltip,
                    hint: 'Geht zur vorherigen Ansicht',
                    child: IconButton(
                      constraints: BoxConstraints.tightFor(
                        width: 44,
                        height: 44,
                      ),
                      icon: Icon(backIcon, color: scheme.onSecondary),
                      tooltip: backTooltip,
                      onPressed: () {
                        final router = GoRouter.of(context);
                        router.canPop()
                            ? router.pop()
                            : context.goNamed(AppRoutes.home);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          PositionedDirectional(
            top: 0,
            end: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: paddingTop,
                  end: paddingSide,
                ),
                child: Material(
                  color: scheme.secondary,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: Semantics(
                    button: true,
                    label: homeTooltip,
                    hint: 'Öffnet die Startseite und löscht den Verlauf',
                    child: IconButton(
                      icon: Icon(homeIcon, color: scheme.onSecondary),
                      tooltip: homeTooltip,
                      onPressed: () {
                        ref.read(moodSelectProvider.notifier).clear();
                        ref.read(modeSelectProvider.notifier).clear();
                        ref.read(areaSelectProvider.notifier).clear();
                        ref.read(activitySelectProvider.notifier).clear();
                        context.goNamed(AppRoutes.home);
                      },
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
