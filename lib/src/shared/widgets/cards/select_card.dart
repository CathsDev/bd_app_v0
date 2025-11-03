import 'package:bd_app_v0/src/core/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/mode_select/models/mode_model.dart';
import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  final ModeModel mode;
  final bool selected;
  final VoidCallback onTap;
  const SelectCard({
    super.key,
    required this.mode,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.all(8),
      color: selected ? scheme.secondary : scheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  mode.imagePath,
                  width: 88,
                  height: 148,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mode.title, style: TextStyles.cardTitle),
                    if (mode.subtitle != null) const SizedBox(height: 8),
                    if (mode.subtitle != null)
                      Text(mode.subtitle!, style: TextStyles.cardSubtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
