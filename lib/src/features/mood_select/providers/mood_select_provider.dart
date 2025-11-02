import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodSelectState {
  final String? selectedId;
  const MoodSelectState({this.selectedId});

  factory MoodSelectState.initial() => const MoodSelectState();
}

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

final moodSelectProvider =
    NotifierProvider<MoodSelectNotifier, MoodSelectState>(
      MoodSelectNotifier.new,
    );
