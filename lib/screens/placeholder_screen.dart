import 'package:flutter/material.dart';

import '../theme/vault_theme.dart';

/// Stand-in for tabs that belong to later phases.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.phase,
  });

  final String title;
  final IconData icon;
  final String phase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: VaultColors.secondary),
              const SizedBox(height: 16),
              Text(title, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Arrives in $phase',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: VaultColors.mutedInk),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
