import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderImage extends StatelessWidget {
  // Image
  final String assetsPath;

  // rechter Home Icon Button
  final bool showHome;
  final IconData homeIcon;
  final String homeTooltip;

  // linker Back Icon Button
  final bool showBack;
  final IconData backIcon;
  final String backTooltip;

  const HeaderImage({
    super.key,
    this.assetsPath = 'assets/images/header/mood.png',
    this.showHome = false,
    this.homeIcon = Icons.home,
    this.homeTooltip = 'Startseite',
    this.showBack = false,
    this.backIcon = Icons.arrow_back,
    this.backTooltip = 'Zurück',
  });

  @override
  Widget build(BuildContext context) {
    // Header Höhe
    final mq = MediaQuery.of(context);
    final screenHeight = mq.size.height;
    final headerHeight = screenHeight * 0.39;

    // Statusbar Höhe
    final topInset = mq.padding.top; // Statusbar
    final statusbarScrimExtra = 4.0; // Puffer
    final topScrimHeight = topInset + statusbarScrimExtra;

    final statusbarScrimAlpha = 0.32;

    final double paddingTop = 8.0;
    final double paddingSide = 12.0;

    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: headerHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            assetsPath,
            fit: BoxFit.cover,
            excludeFromSemantics: true,
          ),

          // Scrim oben
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: topScrimHeight,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.5, 1.0],
                    colors: [
                      scheme.surface.withValues(alpha: statusbarScrimAlpha),
                      scheme.surface.withValues(alpha: statusbarScrimAlpha),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Scrim unten
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: topScrimHeight,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.6, 1.0],
                  colors: [
                    scheme.surface,
                    scheme.surface.withValues(alpha: 0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          if (showBack)
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
          if (showHome)
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
                        onPressed: () => context.goNamed(AppRoutes.home),
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
