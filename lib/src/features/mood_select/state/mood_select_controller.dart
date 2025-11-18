import 'package:bd_app_v0/src/features/mood_select/state/mood_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodSelectNotifier extends Notifier<MoodSelectState> {
  @override
  MoodSelectState build() => MoodSelectState.initial();

  void setSelected(String id) {
    state = MoodSelectState(selectedId: id);
  }

  void clear() {
    state = MoodSelectState.initial();
  }
}
