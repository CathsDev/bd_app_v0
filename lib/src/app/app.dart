import 'package:bd_app_v0/src/app/config/app_config.dart';
import 'package:bd_app_v0/src/app/router.dart';
import 'package:bd_app_v0/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: AppConfig.debugBanner,
      title: AppConfig.appName,
      routerConfig: router,
    );
  }
}
