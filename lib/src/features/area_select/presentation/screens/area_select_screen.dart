import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:bd_app_v0/src/shared/providers/session_provider.dart';
import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/area_select/state/area_select_provider.dart';
import 'package:bd_app_v0/src/shared/domain/area.dart';
import 'package:bd_app_v0/src/shared/widgets/cards/select_card.dart';
import 'package:bd_app_v0/src/shared/widgets/header/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AreaSelectScreen extends ConsumerWidget {
  const AreaSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(areaSelectProvider).selectedId;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderImage(
            assetsPath: AssetsPath.areas,
            showBack: true,
            showHome: true,
          ),
          Semantics(
            header: true,
            label: 'Räume',
            hint: 'Raum auswählen',
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Welcher Raum hat Priorität?',
                style: TextStyles.textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
              itemBuilder: (context, index) {
                final area = areas[index];
                return SelectCard(
                  title: area.name,
                  imagePath: area.imagePath,
                  selected: area.id == selectedId,
                  onTap: () {
                    ref.read(areaSelectProvider.notifier).setSelected(area.id);
                    ref.read(sessionProvider.notifier).updateArea(area.id);
                    context.pushNamed(AppRoutes.taskSelect);
                  },
                );
              },
              separatorBuilder: (_, _) => const SizedBox.shrink(),
              itemCount: areas.length,
            ),
          ),
        ],
      ),
    );
  }
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
  Area(id: 'garage', name: 'Garage', isActive: true, imageKey: 'garage'),
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
  Area(id: 'laundry', name: 'Waschküche', isActive: true, imageKey: 'laundry'),
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
