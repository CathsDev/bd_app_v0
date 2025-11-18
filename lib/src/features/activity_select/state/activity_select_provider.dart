import 'package:bd_app_v0/src/features/activity_select/state/activity_select_controller.dart';
import 'package:bd_app_v0/src/features/activity_select/state/activity_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activitySelectProvider =
    NotifierProvider<ActivitySelectNotifier, ActivitySelectState>(
      ActivitySelectNotifier.new,
    );
