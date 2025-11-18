import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final bool selected;
  final VoidCallback onTap;
  final double imageWidth;
  final double imageHeight;
  const SelectCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.selected,
    required this.onTap,
    this.imageWidth = 72,
    this.imageHeight = 72,
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
                  imagePath,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.cardTitle),
                    if (subtitle != null) const SizedBox(height: 8),
                    if (subtitle != null)
                      Text(subtitle!, style: TextStyles.cardSubtitle),
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
