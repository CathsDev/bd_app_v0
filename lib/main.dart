import 'package:bd_app_v0/firebase_options.dart';
import 'package:bd_app_v0/src/app/app.dart';
import 'package:bd_app_v0/src/shared/services/areas_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AreasService service = AreasService();
    await service.initializeUserAreas(prefs);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    throw Exception('$e');
  }

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  const ui = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  );

  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: ui,
      child: const ProviderScope(child: App()),
    ),
  );
}
