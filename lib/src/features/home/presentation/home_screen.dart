import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/features/auth/providers/auth_provider.dart';
import 'package:bd_app_v0/src/features/auth/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authRepositoryProvider).signOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Willkommen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (user != null) ...[
              Text('Email: ${user.email}'),
              Text('ID: ${user.id}'),
            ],
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.pushNamed(AppRoutes.moodSelect),
                  child: Text('MoodSelect'),
                ),
                ElevatedButton(
                  onPressed: () => context.pushNamed(AppRoutes.settings),
                  child: Text('Settings'),
                ),
                ElevatedButton(
                  onPressed: () => context.pushNamed(AppRoutes.modeSelect),
                  child: Text('Settings'),
                ),
                ElevatedButton(
                  onPressed: () => context.pushNamed(AppRoutes.activitySelect),
                  child: Text('Settings'),
                ),
                ElevatedButton(
                  onPressed: () => context.pushNamed(AppRoutes.areaSelect),
                  child: Text('Settings'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
