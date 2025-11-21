import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:bd_app_v0/src/shared/providers/session_provider.dart';
import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/area_select/state/area_select_provider.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
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
    final areasAsync = ref.watch(allActiveUserAreasProvider);
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
            child: areasAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (areas) {
                if (areas.isEmpty) {
                  return const Center(child: Text('Keine Räume verfügbar'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
                  itemBuilder: (context, index) {
                    final area = areas[index];
                    return SelectCard(
                      title: area.name,
                      imagePath: area.imagePath,
                      selected: area.id == selectedId,
                      onTap: () {
                        ref
                            .read(areaSelectProvider.notifier)
                            .setSelected(area.id);
                        ref.read(sessionProvider.notifier).updateArea(area.id);
                        context.pushNamed(AppRoutes.taskSelect);
                      },
                    );
                  },
                  separatorBuilder: (_, _) => const SizedBox.shrink(),
                  itemCount: areas.length,
                );
              },
              error: (error, stack) =>
                  Center(child: Text('Fehler beim Laden der Räume: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
