class SessionState {
  final String? mood;
  final String? mode;
  final String? area;
  final String? activity;
  final DateTime? startTime;

  SessionState({
    this.mood,
    this.mode,
    this.area,
    this.activity,
    this.startTime,
  });

  factory SessionState.initial() {
    return SessionState(
      mood: null,
      mode: null,
      area: null,
      activity: null,
      startTime: null,
    );
  }

  SessionState copyWith({
    String? mood,
    String? mode,
    String? area,
    String? activity,
    DateTime? startTime,
  }) {
    return SessionState(
      mood: mood ?? this.mood,
      mode: mode ?? this.mode,
      area: area ?? this.area,
      activity: activity ?? this.activity,
      startTime: startTime ?? this.startTime,
    );
  }

  factory SessionState.fromJson(Map<String, dynamic> json) {
    return SessionState(
      mood: json['mood'] as String,
      mode: json['mode'] as String,
      area: json['area'] as String,
      activity: json['activity'] as String,
      startTime: json['startTime'] != null
          ? DateTime.parse(json['startTime'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'mood': mood,
    'mode': mode,
    'area': area,
    'activity': activity,
    'startTime': startTime?.toIso8601String(),
  };
}
