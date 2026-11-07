import 'package:flutter/material.dart';

import 'screens/main_shell.dart';
import 'theme/vault_theme.dart';

void main() {
  runApp(const GossipVaultApp());
}

class GossipVaultApp extends StatelessWidget {
  const GossipVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GossipVault',
      debugShowCheckedModeBanner: false,
      theme: buildVaultTheme(),
      home: const MainShell(),
    );
  }
}
