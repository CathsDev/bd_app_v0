import 'package:bd_app_v0/src/features/mood_select/models/mood_model.dart';
import 'package:flutter/material.dart';

class MoodTile extends StatefulWidget {
  final Mood mood;
  final bool selected;
  final VoidCallback onTap;
  final ColorScheme cs;
  const MoodTile({
    super.key,
    required this.mood,
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
      label: 'Stimmung: ${widget.mood.labelKey}',
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
                  Icon(widget.mood.icon, size: 36, color: fg),
                  const SizedBox(height: 8),
                  Text(
                    widget.mood.labelKey,
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
