import 'package:bd_app_v0/src/shared/constants/assets.dart';
import 'package:bd_app_v0/src/shared/providers/session_provider.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/mode_select/domain/mode.dart';
import 'package:bd_app_v0/src/features/mode_select/state/mode_select_provider.dart';
import 'package:bd_app_v0/src/shared/widgets/cards/select_card.dart';
import 'package:bd_app_v0/src/shared/widgets/header/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ModeSelectScreen extends ConsumerWidget {
  const ModeSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(modeSelectProvider).selectedId;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderImage(
            assetsPath: AssetsPath.mode,
            showHome: true,
            showBack: true,
          ),
          Semantics(
            header: true,
            label: 'Raum oder Tätigkeit?',
            hint: 'Auswahl treffen zwischen Raum oder Tätigkeit',
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Fokus auf einen Raum oder eine Tätigkeit?',
                style: TextStyles.textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
              itemBuilder: (context, index) {
                final mode = modes[index];
                return SelectCard(
                  title: mode.title,
                  imagePath: mode.imagePath,
                  imageWidth: 88,
                  imageHeight: 148,
                  subtitle: mode.subtitle,
                  selected: mode.id == selectedId,
                  onTap: () {
                    ref.read(modeSelectProvider.notifier).setSelected(mode.id);
                    ref.read(sessionProvider.notifier).updateMode(mode.id);
                    context.pushNamed(mode.route);
                  },
                );
              },
              separatorBuilder: (_, _) => const SizedBox.shrink(),
              itemCount: modes.length,
            ),
          ),
        ],
      ),
    );
  }
}
