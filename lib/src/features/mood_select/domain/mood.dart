import 'package:flutter/material.dart';

class Mood {
  final String id;
  final String labelKey;
  final int energyLevel;
  final IconData icon;

  const Mood({
    required this.id,
    required this.labelKey,
    required this.energyLevel,
    required this.icon,
  });
}

const moods = <Mood>[
  Mood(
    id: 'emergency',
    labelKey: 'Notfall',
    energyLevel: 0,
    icon: Icons.airline_seat_individual_suite_outlined,
  ),
  Mood(
    id: 'very_bad',
    labelKey: 'Sehr schlecht',
    energyLevel: 1,
    icon: Icons.sentiment_very_dissatisfied_rounded,
  ),
  Mood(
    id: 'bad',
    labelKey: 'Schlecht',
    energyLevel: 2,
    icon: Icons.sentiment_dissatisfied_rounded,
  ),
  Mood(
    id: 'neutral',
    labelKey: 'Geht so',
    energyLevel: 3,
    icon: Icons.sentiment_neutral_rounded,
  ),
  Mood(
    id: 'good',
    labelKey: 'Gut',
    energyLevel: 4,
    icon: Icons.sentiment_satisfied_rounded,
  ),
  Mood(
    id: 'very_good',
    labelKey: 'Sehr gut',
    energyLevel: 5,
    icon: Icons.sentiment_very_satisfied_rounded,
  ),
];
