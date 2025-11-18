import 'package:bd_app_v0/src/features/mode_select/state/mode_select_controller.dart';
import 'package:bd_app_v0/src/features/mode_select/state/mode_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modeSelectProvider =
    NotifierProvider<ModeSelectNotifier, ModeSelectState>(
      ModeSelectNotifier.new,
    );
