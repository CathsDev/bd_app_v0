import 'dart:ui' show ImageFilter;

import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/auth/data/auth_repository.dart';
import 'package:bd_app_v0/src/features/home/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.39;
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Hintergrundbild
          Image.asset(
            AssetsPath.home,
            fit: BoxFit.cover,
            excludeFromSemantics: true,
          ),

          // Blur
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                // Todo: Farbe
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, right: 12),
                            child: Material(
                              color: ColorPalette.burgundy2,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAlias,
                              child: Semantics(
                                button: true,
                                label: 'Abmelden',
                                hint: 'Wechselt zur Onboarding-Seite',

                                // Logout Button
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => ref
                                      .read(authRepositoryProvider)
                                      .signOut(),
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
                          'BrainDump',
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
                          HomeCard(
                            title: 'Los geht\'s',
                            subtitle: 'Lass uns starten',
                            onTap: () =>
                                context.pushNamed(AppRoutes.moodSelect),
                          ),
                          const SizedBox(height: 12),
                          HomeCard(
                            title: 'Weiter machen',
                            subtitle: 'Derzeit nicht verfügbar',
                            enabled: false,
                          ),
                          const SizedBox(height: 12),
                          HomeCard(
                            title: 'Einstellungen',
                            subtitle: 'Profil, Darstellung, Daten ...',
                            onTap: () => context.pushNamed(AppRoutes.settings),
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
