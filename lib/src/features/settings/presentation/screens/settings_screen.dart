import 'dart:ui';

import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/settings/presentation/widgets/settings_card.dart';
import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.39;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Hintergrundbild
          Image.asset(
            AssetsPath.settings,
            fit: BoxFit.cover,
            excludeFromSemantics: true,
          ),

          // Blur
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: ColorPalette.petrol0.withValues(alpha: 0.50),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: headerHeight,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 8,
                              start: 12,
                            ),
                            child: Material(
                              color: scheme.secondary,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAlias,
                              child: Semantics(
                                button: true,
                                label: 'Zurück',
                                hint: 'Geht zur vorherigen Ansicht',
                                child: IconButton(
                                  constraints: BoxConstraints.tightFor(
                                    width: 44,
                                    height: 44,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: scheme.onSecondary,
                                  ),
                                  tooltip: 'Zurück',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 8,
                              end: 12,
                            ),
                            child: Material(
                              color: scheme.secondary,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAlias,
                              child: Semantics(
                                button: true,
                                label: 'Startseite',
                                hint:
                                    'Öffnet die Startseite und löscht den Verlauf',
                                child: IconButton(
                                  constraints: BoxConstraints.tightFor(
                                    width: 44,
                                    height: 44,
                                  ),
                                  icon: Icon(
                                    Icons.home,
                                    color: scheme.onSecondary,
                                  ),
                                  tooltip: 'Home',
                                  onPressed: () {
                                    context.goNamed(AppRoutes.home);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Logo
                      Center(
                        child: Image.asset(
                          AssetsPath.logo,
                          width: 160,
                          height: 160,
                          fit: BoxFit.contain,
                          excludeFromSemantics: true,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Headline
                      Semantics(
                        header: true,
                        child: Text(
                          'Einstellungen',
                          textAlign: TextAlign.center,
                          style: TextStyles.appTitle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          SettingsCard(
                            title: 'Profil',
                            onTap: () => context.pushNamed(AppRoutes.account),
                          ),
                          const SizedBox(height: 16),
                          SettingsCard(
                            title: 'Räume',
                            onTap: () => context.pushNamed(AppRoutes.areas),
                          ),
                          const SizedBox(height: 8),
                          SettingsCard(
                            title: 'Tätigkeiten',
                            enabled: false,
                            onTap: () =>
                                context.pushNamed(AppRoutes.activities),
                          ),
                          const SizedBox(height: 16),
                          SettingsCard(
                            title: 'Darstellung',
                            enabled: false,
                            onTap: () => context.pushNamed(AppRoutes.areas),
                          ),
                          const SizedBox(height: 16),
                          SettingsCard(
                            title: 'Datenschutz',
                            enabled: false,
                            onTap: () => context.pushNamed(AppRoutes.areas),
                          ),
                          const SizedBox(height: 8),
                          SettingsCard(
                            title: 'Impressum',
                            enabled: false,
                            onTap: () => context.pushNamed(AppRoutes.areas),
                          ),
                          const SizedBox(height: 8),
                          SettingsCard(
                            title: 'Version',
                            enabled: false,
                            onTap: () => context.pushNamed(AppRoutes.areas),
                          ),
                        ],
                      ),
                    ),
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
