import 'package:flutter/material.dart';

/// Obsidian Sanctuary palette, from docs/design/DESIGN.md (prose values).
abstract final class VaultColors {
  static const canvas = Color(0xFF08080B);
  static const secondarySurface = Color(0xFF121216);
  static const primarySurface = Color(0xFF19191F);
  static const elevatedSurface = Color(0xFF222229);
  static const stroke = Color(0xFF333139);
  static const mutedInk = Color(0xFFB8B4BD);
  static const primary = Color(0xFFB9A3F2);
  static const secondary = Color(0xFF9278CC);
  static const ivory = Color(0xFFF5F0E8);
  static const errorInk = Color(0xFFFFB4AB);
}

/// Corner radii from DESIGN.md "Shapes".
abstract final class VaultRadius {
  static const control = 8.0;
  static const card = 16.0;
  static const sheet = 24.0;
}

ThemeData buildVaultTheme() {
  final scheme = ColorScheme.dark(
    primary: VaultColors.primary,
    onPrimary: VaultColors.canvas,
    secondary: VaultColors.secondary,
    onSecondary: VaultColors.ivory,
    surface: VaultColors.canvas,
    onSurface: VaultColors.ivory,
    onSurfaceVariant: VaultColors.mutedInk,
    surfaceContainerHighest: VaultColors.elevatedSurface,
    outline: VaultColors.stroke,
    outlineVariant: VaultColors.stroke,
    error: VaultColors.errorInk,
  );

  final base = ThemeData.dark(useMaterial3: true).textTheme;
  final text = base
      .apply(
        fontFamily: 'Inter',
        bodyColor: VaultColors.ivory,
        displayColor: VaultColors.ivory,
      )
      .copyWith(
        headlineMedium: base.headlineMedium?.copyWith(
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          color: VaultColors.ivory,
        ),
        headlineSmall: base.headlineSmall?.copyWith(
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
          color: VaultColors.ivory,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
          color: VaultColors.ivory,
        ),
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: VaultColors.canvas,
    textTheme: text,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: VaultColors.canvas,
      indicatorColor: const Color(0x339278CC),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: selected ? VaultColors.primary : VaultColors.mutedInk,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? VaultColors.primary : VaultColors.mutedInk,
        );
      }),
    ),
  );
}
