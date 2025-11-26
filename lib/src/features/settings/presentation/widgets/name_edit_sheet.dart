import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:bd_app_v0/src/features/settings/state/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameEditSheet extends ConsumerStatefulWidget {
  final String initialName;
  const NameEditSheet({super.key, this.initialName = ''});

  @override
  ConsumerState<NameEditSheet> createState() => _NameEditSheetState();
}

class _NameEditSheetState extends ConsumerState<NameEditSheet> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.petrol0.withValues(alpha: 0.98),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle
                Container(
                  width: 80,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.24),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(height: 12),
                // Title
                Text(
                  'Benutzername',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorPalette.text0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Email
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Benutzername eingeben',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Error Message
                /* if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
               */
                // Submit Button
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: ColorPalette.petrol2,
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    ref
                        .read(userNotifierProvider.notifier)
                        .updateName(_nameController.text);
                    Navigator.pop(context);
                  },
                  child: Text('Übernehmen'),
                ),
                const SizedBox(height: 8),

                // Close Button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Schließen',
                    style: TextStyle(
                      color: ColorPalette.text1.withValues(alpha: 0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
