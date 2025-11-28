import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final bool enabled;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    this.enabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = enabled
        ? ColorPalette.petrol2
        : ColorPalette.petrol2.withValues(alpha: 0.6);

    final textColor = enabled
        ? ColorPalette.text0
        : ColorPalette.text0.withValues(alpha: 0.5);

    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
