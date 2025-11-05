import 'package:flutter/material.dart';

class MoodModel {
  final String id;
  final String label;
  final int energie;
  final IconData icon;

  const MoodModel({
    required this.id,
    required this.label,
    required this.energie,
    required this.icon,
  });
}

const moods = <MoodModel>[
  MoodModel(
    id: 'emergency',
    label: 'Notfall',
    energie: 0,
    icon: Icons.airline_seat_individual_suite_outlined,
  ),
  MoodModel(
    id: 'very_bad',
    label: 'Sehr schlecht',
    energie: 1,
    icon: Icons.sentiment_very_dissatisfied_rounded,
  ),
  MoodModel(
    id: 'bad',
    label: 'Schlecht',
    energie: 2,
    icon: Icons.sentiment_dissatisfied_rounded,
  ),
  MoodModel(
    id: 'neutral',
    label: 'Geht so',
    energie: 3,
    icon: Icons.sentiment_neutral_rounded,
  ),
  MoodModel(
    id: 'happy',
    label: 'Gut',
    energie: 4,
    icon: Icons.sentiment_satisfied_rounded,
  ),
  MoodModel(
    id: 'very_happy',
    label: 'Sehr gut',
    energie: 5,
    icon: Icons.sentiment_very_satisfied_rounded,
  ),
];
