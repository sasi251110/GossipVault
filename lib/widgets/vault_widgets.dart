import 'package:flutter/material.dart';

import '../theme/vault_theme.dart';

/// Level 2 surface: #19191F with a 1px #333139 border and 16px radius.
class VaultCard extends StatelessWidget {
  const VaultCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: VaultColors.primarySurface,
        borderRadius: BorderRadius.circular(VaultRadius.card),
        border: Border.all(color: VaultColors.stroke),
      ),
      child: child,
    );
  }
}

/// Pill badge such as "Encrypted" or "Confidante".
class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: VaultColors.secondarySurface,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: VaultColors.stroke),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: VaultColors.primary),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: VaultColors.primary,
                  letterSpacing: 0.02 * 12,
                ),
          ),
        ],
      ),
    );
  }
}

/// Square private-tool tile. Disabled tiles show a message instead of acting.
class PrivateToolTile extends StatelessWidget {
  const PrivateToolTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VaultColors.primarySurface,
      borderRadius: BorderRadius.circular(VaultRadius.card),
      child: InkWell(
        borderRadius: BorderRadius.circular(VaultRadius.card),
        onTap: onTap,
        child: Container(
          height: 96,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(VaultRadius.card),
            border: Border.all(color: VaultColors.stroke),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: VaultColors.secondarySurface,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 20, color: VaultColors.secondary),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: VaultColors.ivory,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
