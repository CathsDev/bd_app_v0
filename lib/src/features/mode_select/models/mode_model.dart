import 'package:bd_app_v0/src/core/constants/assets.dart';
import 'package:bd_app_v0/src/core/routing/route_names.dart';

class ModeModel {
  final String id;
  final String title;
  final String? subtitle;
  final String imagePath;
  final String route;

  const ModeModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.route,
  });
}

const modes = <ModeModel>[
  ModeModel(
    id: 'activity',
    title: 'Tätigkeit',
    subtitle:
        'Wähle eine Tätigkeit aus, die jetzt im Moment für dich die höchste Priorität hat. Zum Beispiel: Wäsche waschen!',
    imagePath: AssetsPath.activity,
    route: AppRoutes.activitySelect,
  ),
  ModeModel(
    id: 'area',
    title: 'Raum',
    subtitle:
        'Wähle den Raum aus, der jetzt im Moment für dich die höchste Priorität hat. Zum Beispiel: Wohnzimmer!',
    imagePath: AssetsPath.area,
    route: AppRoutes.areaSelect,
  ),
];
