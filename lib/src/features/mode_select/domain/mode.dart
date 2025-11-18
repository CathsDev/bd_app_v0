import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:bd_app_v0/src/app/app_routes.dart';

class Mode {
  final String id;
  final String title;
  final String? subtitle;
  final String imagePath;
  final String route;

  const Mode({
    required this.id,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.route,
  });
}

const modes = <Mode>[
  Mode(
    id: 'activity',
    title: 'Tätigkeit',
    subtitle:
        'Wähle eine Tätigkeit aus, die jetzt im Moment für dich die höchste Priorität hat. Zum Beispiel: Wäsche waschen!',
    imagePath: AssetsPath.activity,
    route: AppRoutes.activitySelect,
  ),
  Mode(
    id: 'area',
    title: 'Raum',
    subtitle:
        'Wähle den Raum aus, der jetzt im Moment für dich die höchste Priorität hat. Zum Beispiel: Wohnzimmer!',
    imagePath: AssetsPath.area,
    route: AppRoutes.areaSelect,
  ),
];
