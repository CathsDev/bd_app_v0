import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:bd_app_v0/src/features/mood_select/models/mood_model.dart';
import 'package:bd_app_v0/src/shared/widgets/header/header_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoodSelectScreen extends StatelessWidget {
  const MoodSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderImage(
            assetsPath: 'assets/images/header/mood.png',
            showHome: true,
            showBack: true,
          ),
          Semantics(
            header: true,
            label: 'Wie geht es dir heute?',
            hint: 'Wähle deine Stimmung aus',
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Wie geht es dir heute?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                primary: false,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.95, // leicht höher als breit
                children: [
                  /* MoodCard(
                    moodValue: 1,
                    label: 'Sehr schlecht', // später i18n
                    isActive: moodLevel == 1,
                    onTap: () => ref.read(moodProvider.notifier).setMood(1),
                  ),
                  MoodCard(
                    moodValue: 2,
                    label: 'Schlecht', // später i18n
                    isActive: moodLevel == 2,
                    onTap: () => ref.read(moodProvider.notifier).setMood(2),
                  ),
                  MoodCard(
                    moodValue: 3,
                    label: 'Eher schlecht', // später i18n
                    isActive: moodLevel == 3,
                    onTap: () => ref.read(moodProvider.notifier).setMood(3),
                  ),
                  MoodCard(
                    moodValue: 4,
                    label: 'Eher gut', // später i18n
                    isActive: moodLevel == 4,
                    onTap: () => ref.read(moodProvider.notifier).setMood(4),
                  ),
                  MoodCard(
                    moodValue: 5,
                    label: 'Gut', // später i18n
                    isActive: moodLevel == 5,
                    onTap: () => ref.read(moodProvider.notifier).setMood(5),
                  ),
                  MoodCard(
                    moodValue: 6,
                    label: 'Sehr gut', // später i18n
                    isActive: moodLevel == 6,
                    onTap: () => ref.read(moodProvider.notifier).setMood(6),
                  ), */
                ],
              ),
            ),
          ),
          SafeArea(
            child: Visibility(
              visible: true,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.modeSelect);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.petrol2,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Los geht's",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoodSelectGrid extends StatefulWidget {
  final String? initialMoodId;
  final ValueChanged<MoodModel>? onChanged;
  const MoodSelectGrid({super.key, this.initialMoodId, this.onChanged});

  @override
  State<MoodSelectGrid> createState() => _MoodSelectGridState();
}

class _MoodSelectGridState extends State<MoodSelectGrid> {
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialMoodId;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      primary: false,
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.95, // leicht höher als breit
      children: [
        for (final m in moods)
          MoodTile(
            option: m,
            selected: m.id == _selectedId,
            onTap: () {
              setState(() => _selectedId = m.id);
              widget.onChanged?.call(m);
            },
            cs: cs,
          ),
      ],
    );
  }
}

class MoodTile extends StatefulWidget {
  final MoodModel option;
  final bool selected;
  final VoidCallback onTap;
  final ColorScheme cs;
  const MoodTile({
    super.key,
    required this.option,
    required this.selected,
    required this.onTap,
    required this.cs,
  });

  @override
  State<MoodTile> createState() => _MoodTileState();
}

class _MoodTileState extends State<MoodTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;
    final cs = widget.cs;

    final bg = selected ? cs.secondary : cs.surface;
    final fg = selected ? cs.onSecondary : cs.onSurface.withValues(alpha: 0.87);
    final border = selected
        ? Colors.transparent
        : cs.onSurface.withValues(alpha: 0.16);

    return Semantics(
      button: true,
      selected: selected,
      label: 'Stimmung: ${widget.option.label}',
      hint: selected ? 'Ausgewählt' : 'Auswählen',
      child: AnimatedScale(
        scale: _pressed ? 0.98 : 1,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: border),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: cs.shadow.withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : const [],
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: widget.onTap,
              onHighlightChanged: (value) => setState(() => _pressed = value),
              borderRadius: BorderRadius.circular(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.option.icon, size: 36, color: fg),
                  const SizedBox(height: 8),
                  Text(
                    widget.option.label,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: fg,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (selected) ...[
                    const SizedBox(height: 6),
                    Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: fg.withValues(alpha: 0.9),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
