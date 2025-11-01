import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/features/home/presentation/home_screen.dart';
import 'package:bd_app_v0/src/features/mood_select/presentation/mood_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.home,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: AppRoutes.moodSelect,
      path: '/${AppRoutes.moodSelect}',
      builder: (BuildContext context, GoRouterState state) {
        return const MoodSelectScreen();
      },
    ),
    GoRoute(
      name: AppRoutes.modeSelect,
      path: '/${AppRoutes.modeSelect}',
      builder: (BuildContext context, GoRouterState state) {
        return const MoodSelectScreen();
      },
    ),
  ],
  errorBuilder: (context, state) => const HomeScreen(),
);
