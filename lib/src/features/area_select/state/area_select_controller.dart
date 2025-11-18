import 'package:bd_app_v0/src/features/area_select/state/area_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AreaSelectNotifier extends Notifier<AreaSelectState> {
  @override
  AreaSelectState build() => AreaSelectState.initial();

  void setSelected(String id) {
    state = AreaSelectState(selectedId: id);
  }

  void clear() {
    state = AreaSelectState.initial();
  }
}
