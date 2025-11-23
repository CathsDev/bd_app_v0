import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AreasSettingsScreen extends ConsumerWidget {
  const AreasSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final areasAsync = ref.watch(allUserAreasProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Räume verwalten'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: areasAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Fehler: $e')),
          data: (areas) {
            if (areas.isEmpty) {
              return const Center(child: Text('Keine Liste vorhanden'));
            }
            return ListView.builder(
              itemCount: areas.length,
              itemBuilder: (context, index) {
                final area = areas[index];
                return CheckboxListTile(
                  key: ValueKey(area.id),
                  title: Text(area.name),
                  value: area.isActive,
                  onChanged: (status) {
                    if (status == null) return;
                    if (area.isActive == true && status == false) {
                      final activeCount = areas
                          .where((area) => area.isActive)
                          .length;
                      if (activeCount <= 1) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Achtung'),
                            content: Text(
                              'Es muss immer mindestens ein Raum ausgewählt sein!',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: ColorPalette.text1),
                                ),
                              ),
                            ],
                          ),
                        );
                        return;
                      }
                    }
                    ref
                        .read(areasNotifierProvider.notifier)
                        .updateAreaStatus(area.id, status);
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
