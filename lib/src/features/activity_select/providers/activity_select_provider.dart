import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitySelectState {
  final String? selectedId;
  const ActivitySelectState({this.selectedId});
  factory ActivitySelectState.initial() => ActivitySelectState();
  ActivitySelectState copyWith({String? id}) {
    return ActivitySelectState(selectedId: id ?? selectedId);
  }
}

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

final activitySelectProvider =
    NotifierProvider<ActivitySelectNotifier, ActivitySelectState>(
      ActivitySelectNotifier.new,
    );
