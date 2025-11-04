import 'package:bd_app_v0/src/core/constants/assets.dart';

class AreaModel {
  final String id;
  final String title;
  final String? subtitle;
  final String imagePath;

  const AreaModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.imagePath,
  });
}

const areas = <AreaModel>[
  AreaModel(
    id: 'storage',
    title: 'Abstellraum',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'bath',
    title: 'Badezimmer',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'kids',
    title: 'Kinderzimmer',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'living',
    title: 'Wohnzimmer',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(id: 'office', title: 'Büro', imagePath: AssetsPath.areaPlaceholder),
  AreaModel(
    id: 'kitchen',
    title: 'Küche',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'balcony',
    title: 'Balkon',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'basement',
    title: 'Keller',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'bedroom',
    title: 'Schlafzimmer',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'gasts',
    title: 'Gästezimmer',
    imagePath: AssetsPath.areaPlaceholder,
  ),
  AreaModel(
    id: 'garden',
    title: 'Garten',
    imagePath: AssetsPath.areaPlaceholder,
  ),
];
