class AreaSelectState {
  final String? selectedId;

  const AreaSelectState({this.selectedId});

  factory AreaSelectState.initial() => AreaSelectState();

  AreaSelectState copyWith({String? id}) {
    return AreaSelectState(selectedId: id ?? selectedId);
  }
}
