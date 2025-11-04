import 'package:bd_app_v0/src/core/constants/assets.dart';

class ActivityModel {
  final String id;
  final String title;
  final String? subtitle;
  final String imagePath;

  const ActivityModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.imagePath,
  });
}

const activities = <ActivityModel>[
  ActivityModel(
    id: 'laundry',
    title: 'Wäsche waschen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  ActivityModel(
    id: 'cleaning',
    title: 'Putzen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  ActivityModel(
    id: 'cooking',
    title: 'Kochen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  ActivityModel(
    id: 'shopping',
    title: 'Einkaufen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  ActivityModel(
    id: 'organizing',
    title: 'Aufräumen',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  ActivityModel(
    id: 'repair',
    title: 'Reparieren',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  ActivityModel(
    id: 'pets',
    title: 'Haustiere',
    imagePath: AssetsPath.areaPlaceholder,
  ),
];
