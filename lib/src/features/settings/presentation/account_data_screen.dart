import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountDataScreen extends StatelessWidget {
  const AccountDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Daten'),
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
                  title: const Text('E-Mail'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Konto-Details öffnen
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Sync-Einstellungen
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
