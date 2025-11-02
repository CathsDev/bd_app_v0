import 'package:flutter/material.dart';

class MoodModel {
  final String id;
  final String label;
  final IconData icon;

  const MoodModel({required this.id, required this.label, required this.icon});
}

const moods = <MoodModel>[
  MoodModel(
    id: 'very_bad',
    label: 'Sehr schlecht',
    icon: Icons.sentiment_satisfied_rounded,
  ),
  MoodModel(
    id: 'bad',
    label: 'Schlecht',
    icon: Icons.sentiment_satisfied_rounded,
  ),
  MoodModel(
    id: 'sad',
    label: 'Traurig',
    icon: Icons.sentiment_satisfied_rounded,
  ),
  MoodModel(
    id: 'tired',
    label: 'Müde',
    icon: Icons.sentiment_satisfied_rounded,
  ),
  MoodModel(id: 'happy', label: 'gut', icon: Icons.sentiment_satisfied_rounded),
  MoodModel(
    id: 'very_happy',
    label: 'Sehr gut',
    icon: Icons.sentiment_satisfied_rounded,
  ),
];
