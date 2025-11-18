import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Account & Daten',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('E-Mail, Passwort ändern'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Konto-Details öffnen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text(
                    'Haushalt & Bereiche',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('Räume anpassen'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Sync-Einstellungen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text(
                    'App & Darstellung',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('Theme, Sprache, Version'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Bestätigungsdialog + History löschen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text(
                    'Datenschutz',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Exportfunktion
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text(
                    'Impressum',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Exportfunktion
                  },
                ),
                /* ListTile(
                  title: const Text('Konto'),
                  subtitle: const Text('E-Mail, Passwort ändern'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Konto-Details öffnen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Datensynchronisation'),
                  subtitle: const Text('Lokal speichern'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Sync-Einstellungen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Verlauf löschen'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Bestätigungsdialog + History löschen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Backup/Restore'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Backup/Restore Screen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Daten exportieren'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Exportfunktion
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('App Info'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // App Version
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Datenschutz'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Exportfunktion
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Impressum'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Exportfunktion
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: Text(
                    'Konto löschen',
                    style: TextStyle(color: scheme.error),
                  ),
                  trailing: Icon(Icons.chevron_right, color: scheme.error),
                  onTap: () {
                    // großer, fieser Warn-Dialog
                  },
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
