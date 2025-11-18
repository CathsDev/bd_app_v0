import 'package:bd_app_v0/src/features/mode_select/state/mode_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeSelectNotifier extends Notifier<ModeSelectState> {
  @override
  ModeSelectState build() => ModeSelectState.initial();

  void setSelected(String id) {
    state = ModeSelectState(selectedId: id);
  }

  void clear() {
    state = ModeSelectState.initial();
  }
}
