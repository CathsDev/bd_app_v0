class ActivitySelectState {
  final String? selectedId;
  const ActivitySelectState({this.selectedId});
  factory ActivitySelectState.initial() => ActivitySelectState();
  ActivitySelectState copyWith({String? id}) {
    return ActivitySelectState(selectedId: id ?? selectedId);
  }
}
