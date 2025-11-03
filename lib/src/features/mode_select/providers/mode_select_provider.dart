import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeSelectState {
  final String? selectedId;
  const ModeSelectState({this.selectedId});
  factory ModeSelectState.initial() => ModeSelectState();
}

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

final modeSelectProvider =
    NotifierProvider<ModeSelectNotifier, ModeSelectState>(
      ModeSelectNotifier.new,
    );
