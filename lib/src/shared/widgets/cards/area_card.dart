import 'dart:ui';

import 'package:bd_app_v0/src/core/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/area_select/models/area_model.dart';
import 'package:flutter/material.dart';

class AreaCard extends StatelessWidget {
  final AreaModel model;
  final bool selected;
  final VoidCallback onTap;
  const AreaCard({
    super.key,
    required this.model,
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
                  model.imagePath,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title, style: TextStyles.cardTitle),
                    if (model.subtitle != null) const SizedBox(height: 8),
                    if (model.subtitle != null)
                      Text(model.subtitle!, style: TextStyles.cardSubtitle),
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
