import 'package:bd_app_v0/src/core/constants/assets.dart';

class ModeModel {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;

  const ModeModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

const modes = <ModeModel>[
  ModeModel(
    id: 'activity',
    title: 'Tätigkeit',
    subtitle: 'Eine spezielle Aufgabe',
    imagePath: AssetsPath.activity,
  ),
  ModeModel(
    id: 'area',
    title: 'Raum',
    subtitle: 'Eine speziellen Ort',
    imagePath: AssetsPath.area,
  ),
];
