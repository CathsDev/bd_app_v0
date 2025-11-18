import 'package:bd_app_v0/src/features/mood_select/state/mood_select_controller.dart';
import 'package:bd_app_v0/src/features/mood_select/state/mood_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moodSelectProvider =
    NotifierProvider<MoodSelectNotifier, MoodSelectState>(
      MoodSelectNotifier.new,
    );
