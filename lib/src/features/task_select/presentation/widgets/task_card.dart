import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeTip;
  final VoidCallback onTap;
  final bool selected;
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.timeTip,
    required this.onTap,
    required this.selected,
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
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: TextStyles.cardTitle),
              const SizedBox(height: 4),
              Text(description, style: TextStyles.cardSubtitle),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.access_time, size: 16, color: scheme.onPrimary),
                  const SizedBox(width: 4),
                  Text('$timeTip Min', style: TextStyles.cardTaskTimeTip),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
