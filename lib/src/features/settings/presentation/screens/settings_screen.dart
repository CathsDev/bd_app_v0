import 'dart:ui';

import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = (screenHeight * 0.39) / 1.5;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Einstellungen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ), */
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AssetsPath.settings,
            fit: BoxFit.cover,
            excludeFromSemantics: true,
          ),
          // Blur ?
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
              child: Container(
                // Todo: Farbe
                color: ColorPalette.petrol1.withValues(alpha: 0.50),
              ),
            ),
          ),
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
                            padding: const EdgeInsets.only(top: 8, left: 12),
                            child: Material(
                              color: ColorPalette.burgundy2,
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
                            padding: const EdgeInsets.only(top: 8, right: 12),
                            child: Material(
                              color: ColorPalette.burgundy2,
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
                                    final router = GoRouter.of(context);
                                    router.canPop()
                                        ? router.pop()
                                        : context.goNamed(AppRoutes.home);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
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
                          // CARD 1
                          Card(
                            elevation: 0, // oder 2
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text('Account'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      context.pushNamed(AppRoutes.account),
                                ),
                                Divider(height: 1),
                                ListTile(
                                  leading: Icon(Icons.storage),
                                  title: Text('Daten'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.data),
                                      context.push('/settings/data'),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 8), // Spacing!
                          // CARD 2 (Räume und Tätigkeiten)
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.add_home_rounded),
                                  title: Text('Räume'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.areas),
                                      context.push('/settings/areas'),
                                ),
                                Divider(height: 1),
                                ListTile(
                                  leading: Icon(
                                    Icons.cleaning_services_rounded,
                                  ),
                                  title: Text('Tätigkeiten'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.activities),
                                      context.push('/settings/activities'),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 8),

                          // CARD 3 ... (App + Darstellung)
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.ad_units),
                                  title: Text('App'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.app),
                                      context.push('/settings/app'),
                                ),
                                Divider(height: 1),
                                ListTile(
                                  leading: Icon(Icons.palette_rounded),
                                  title: Text('Darstellung'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.design),
                                      context.push('/settings/design'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),

                          // CARD 4 ... (Datenschutz + Impressum + Version)
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.gpp_maybe_rounded),
                                  title: Text('Datenschutz'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.privacy),
                                      context.push('/settings/privacy'),
                                ),
                                Divider(height: 1),
                                ListTile(
                                  leading: Icon(Icons.info_rounded),
                                  title: Text('Impressum'),
                                  trailing: Icon(Icons.chevron_right),
                                  onTap: () =>
                                      //context.pushNamed(AppRoutes.imprint),
                                      context.push('/settings/imprint'),
                                ),
                                Divider(height: 1),
                                ListTile(
                                  leading: Icon(Icons.fork_right_rounded),
                                  title: Text('Version'),
                                  trailing: Text('v1.0.0'),
                                ),
                              ],
                            ),
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
