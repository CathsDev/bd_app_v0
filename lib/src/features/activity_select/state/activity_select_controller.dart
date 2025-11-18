import 'package:bd_app_v0/src/features/activity_select/state/activity_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitySelectNotifier extends Notifier<ActivitySelectState> {
  @override
  ActivitySelectState build() => ActivitySelectState.initial();

  void setSelected(String id) {
    state = ActivitySelectState(selectedId: id);
  }

  void clear() {
    state = ActivitySelectState.initial();
  }
}
