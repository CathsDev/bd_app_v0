class Area {
  final String id;
  final String name;
  final bool isActive;
  final String? subtitle;
  final String imageKey;

  const Area({
    required this.id,
    required this.name,
    required this.isActive,
    this.subtitle,
    required this.imageKey,
  });

  String get imagePath {
    if (imageKey == 'placeholder' || imageKey.isEmpty) {
      return 'assets/images/areas/default_area.png';
    }
    return 'assets/images/areas/$imageKey.png';
  }

  Area copyWith({
    String? id,
    String? name,
    bool? isActive,
    String? subtitle,
    String? imageKey,
  }) {
    return Area(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      subtitle: subtitle ?? this.subtitle,
      imageKey: imageKey ?? this.imageKey,
    );
  }

  @override
  String toString() =>
      'Area(id: $id, name: $name, isActive: $isActive, subtitle: $subtitle, imageKey: $imageKey)';

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'] as String,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      imageKey: json['imageKey'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isActive': isActive,
    'subtitle': subtitle,
    'imageKey': imageKey,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Area && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const areas = <Area>[
  Area(id: 'balcony', name: 'Balkon', isActive: true, imageKey: 'balcony'),
  Area(id: 'basement', name: 'Keller', isActive: true, imageKey: 'basement'),
  Area(id: 'bath', name: 'Badezimmer', isActive: true, imageKey: 'bath'),
  Area(
    id: 'bedroom',
    name: 'Schlafzimmer',
    isActive: true,
    imageKey: 'bedroom',
  ),
  Area(id: 'garden', name: 'Garten', isActive: true, imageKey: 'garden'),
  Area(
    id: 'guestbath',
    name: 'Gästebad',
    isActive: true,
    imageKey: 'guestbath',
  ),
  Area(
    id: 'guestroom',
    name: 'Gästezimmer',
    isActive: true,
    imageKey: 'guestroom',
  ),
  Area(id: 'hallway', name: 'Flur', isActive: true, imageKey: 'hallway'),
  Area(
    id: 'kidsroom',
    name: 'Kinderzimmer',
    isActive: true,
    imageKey: 'kidsroom',
  ),
  Area(id: 'kitchen', name: 'Küche', isActive: true, imageKey: 'kitchen'),
  Area(id: 'living', name: 'Wohnzimmer', isActive: true, imageKey: 'living'),
  Area(id: 'office', name: 'Büro', isActive: true, imageKey: 'office'),
  Area(
    id: 'playroom',
    name: 'Spielzimmer',
    isActive: true,
    imageKey: 'playroom',
  ),
  Area(id: 'storage', name: 'Abstellraum', isActive: true, imageKey: 'storage'),
  Area(id: 'terrace', name: 'Terrasse', isActive: true, imageKey: 'terrace'),
];
