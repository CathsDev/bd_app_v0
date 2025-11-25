import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/features/activity_select/presentation/screens/activity_select_screen.dart';
import 'package:bd_app_v0/src/features/area_select/presentation/screens/area_select_screen.dart';
import 'package:bd_app_v0/src/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:bd_app_v0/src/features/auth/state/auth_provider.dart';
import 'package:bd_app_v0/src/features/emergency/presentation/screens/emergency_screen.dart';
import 'package:bd_app_v0/src/features/home/presentation/screens/home_screen.dart';
import 'package:bd_app_v0/src/features/mode_select/presentation/screens/mode_select_screen.dart';
import 'package:bd_app_v0/src/features/mood_select/presentation/screens/mood_select_screen.dart';
import 'package:bd_app_v0/src/features/settings/presentation/screens/account_settings_screen.dart';
import 'package:bd_app_v0/src/features/settings/presentation/screens/areas_settings_screen.dart';
import 'package:bd_app_v0/src/features/settings/presentation/screens/settings_screen.dart';
import 'package:bd_app_v0/src/features/task_complete/presentation/screens/task_complete_screen.dart';
import 'package:bd_app_v0/src/features/task_select/presentation/screens/task_select_screen.dart';
import 'package:bd_app_v0/src/features/task_timer/presentation/screens/task_timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      // Wait for auth to load
      final isLoading = authState is AsyncLoading;
      final isAuth = authState.value != null;

      // Loading
      if (isLoading) {
        return null; // Keep current location while loading
      }

      // Not authenticated
      if (!isAuth) {
        // Allow onboarding
        if (state.matchedLocation == '/onboarding') {
          return null;
        }
        return '/onboarding';
      }

      // Authenticated - redirect from onboarding to home
      if (isAuth && state.matchedLocation == '/onboarding') {
        return '/';
      }

      return null; // No redirect
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const OnboardingScreen(),
        ),
        //builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/',
        name: AppRoutes.home,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const HomeScreen(),
        ),
        //builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/mood-select',
        name: AppRoutes.moodSelect,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const MoodSelectScreen(),
        ),
        //builder: (context, state) => const MoodSelectScreen(),
      ),
      GoRoute(
        path: '/mode-select',
        name: AppRoutes.modeSelect,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const ModeSelectScreen(),
        ),
        //builder: (context, state) => const ModeSelectScreen(),
      ),
      GoRoute(
        path: '/area-select',
        name: AppRoutes.areaSelect,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const AreaSelectScreen(),
        ),
        //builder: (context, state) => const AreaSelectScreen(),
      ),
      GoRoute(
        path: '/activity-select',
        name: AppRoutes.activitySelect,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const ActivitySelectScreen(),
        ),
        //builder: (context, state) => const ActivitySelectScreen(),
      ),
      GoRoute(
        path: '/task-select',
        name: AppRoutes.taskSelect,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const TaskSelectScreen(),
        ),
        //builder: (context, state) => const TaskTimerScreen(),
      ),
      GoRoute(
        path: '/task-timer',
        name: AppRoutes.taskTimer,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const TaskTimerScreen(),
        ),
        //builder: (context, state) => const TaskTimerScreen(),
      ),
      GoRoute(
        path: '/task-complete',
        name: AppRoutes.taskComplete,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const TaskCompleteScreen(),
        ),
        //builder: (context, state) => const TaskCompleteScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: AppRoutes.settings,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const SettingsScreen(),
        ),
        //builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/settings/account',
        name: AppRoutes.account,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const AccountSettingsScreen(),
        ),
        //builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/settings/areas',
        name: AppRoutes.areas,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const AreasSettingsScreen(),
        ),
        //builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/emergency',
        name: AppRoutes.emergency,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          allowSnapshotting: false,
          child: const EmergencyScreen(),
        ),
        //builder: (context, state) => const EmergencyScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
});
