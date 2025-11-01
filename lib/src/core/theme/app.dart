import 'package:bd_app_v0/src/core/theme/app_theme.dart';
import 'package:bd_app_v0/src/features/auth/presentation/onboarding_screen.dart';
import 'package:bd_app_v0/src/features/auth/providers/auth_provider.dart';
import 'package:bd_app_v0/src/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: authState.when(
        data: (user) {
          if (user != null) {
            return const HomeScreen();
          }
          return const OnboardingScreen();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (_, _) => const OnboardingScreen(),
      ),
    );
  }
}
