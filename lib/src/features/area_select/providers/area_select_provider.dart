import 'package:flutter_riverpod/flutter_riverpod.dart';

class AreaSelectState {
  final String? selectedId;

  const AreaSelectState({this.selectedId});

  factory AreaSelectState.initial() => AreaSelectState();

  AreaSelectState copyWith({String? id}) {
    return AreaSelectState(selectedId: id ?? selectedId);
  }
}

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

final areaSelectProvider =
    NotifierProvider<AreaSelectNotifier, AreaSelectState>(
      AreaSelectNotifier.new,
    );
