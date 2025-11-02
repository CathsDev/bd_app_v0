import 'dart:ui' show ImageFilter;

import 'package:bd_app_v0/src/core/constants/assets.dart';
import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:bd_app_v0/src/core/theme/text_styles.dart';
//import 'package:bd_app_v0/src/features/auth/providers/auth_provider.dart';
import 'package:bd_app_v0/src/features/auth/repositories/auth_repository.dart';
import 'package:bd_app_v0/src/features/home/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final authUser = ref.watch(currentUserProvider);
    final String userLabel = (authUser?.email?.trim().isNotEmpty ?? false)
        ? authUser!.email!.trim()
        : (authUser?.id ?? 'Nicht angemeldet!'); */
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      HomeCard(
                        title: 'Profil',
                        subtitle: 'Settings für test@test.de',
                        onTap: () => context.pushNamed(AppRoutes.settings),
                      ),
                      const SizedBox(height: 12),
                      HomeCard(
                        title: 'Weiter machen',
                        subtitle: 'Derzeit nicht verfügbar',
                        enabled: false,
                      ),
                      const SizedBox(height: 12),
                      HomeCard(
                        title: 'Los geht\'s',
                        subtitle: 'Lass uns starten',
                        onTap: () => context.pushNamed(AppRoutes.moodSelect),
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


    /* return Scaffold(
      appBar: AppBar(
        title: const Text('BrainDump'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed(AppRoutes.settings),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authRepositoryProvider).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Section
              Text(
                'Willkommen zurück!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              if (user != null) Text('${user.email}'),
              const SizedBox(height: 30),

              // Start Button
              FilledButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () => context.pushNamed(AppRoutes.moodSelect),
                child: const Text(
                  'Neue Aufgabe starten',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),

              // Quick Links
              Text(
                'Schnellzugriff',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildQuickLink(
                      context,
                      'Timer',
                      Icons.timer,
                      AppRoutes.taskTimer,
                    ),
                    _buildQuickLink(
                      context,
                      'Notfall',
                      Icons.warning,
                      AppRoutes.emergency,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLink(
    BuildContext context,
    String label,
    IconData icon,
    String route,
  ) {
    return Card(
      child: InkWell(
        onTap: () => context.pushNamed(route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  } 
}
*/