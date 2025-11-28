import 'package:bd_app_v0/src/shared/constants/assets.dart';

class Activity {
  final String id;
  final String title;
  final String? subtitle;
  final String imagePath;

  const Activity({
    required this.id,
    required this.title,
    this.subtitle,
    required this.imagePath,
  });
}

const activities = <Activity>[
  Activity(
    id: 'laundry',
    title: 'Wäsche waschen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'cleaning',
    title: 'Putzen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'cooking',
    title: 'Kochen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'shopping',
    title: 'Einkaufen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'organizing',
    title: 'Aufräumen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'repair',
    title: 'Reparieren',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'pets',
    title: 'Haustiere',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'wiping',
    title: 'Wischen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'decluttering',
    title: 'Declutter',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'vacuuming',
    title: 'Staubsaugen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'dusting',
    title: 'Staub wischen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  Activity(
    id: 'sorting',
    title: 'Sortieren',
    imagePath: AssetsPath.areaPlaceholder,
  ),
];
