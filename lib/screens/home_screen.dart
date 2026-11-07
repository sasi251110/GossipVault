import 'package:flutter/material.dart';

import '../theme/vault_theme.dart';
import '../widgets/vault_widgets.dart';

/// Home, following docs/design/home_sanctuary.png. Features that do not exist
/// yet show a message; no sample diary content is shown.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _weekdays = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday',
  ];
  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static String _dateLabel(DateTime now) =>
      '${_weekdays[now.weekday - 1]}, ${_months[now.month - 1]} ${now.day}';

  static String _greeting(DateTime now) {
    if (now.hour < 12) return 'Good morning';
    if (now.hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  void _comingSoon(BuildContext context, String feature, String phase) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature arrives in $phase')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo_mark.png', height: 36),
              const SizedBox(width: 12),
              Text('GossipVault', style: theme.textTheme.titleLarge),
              const Spacer(),
              const StatusPill(label: 'Encrypted', icon: Icons.lock_outline),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            _dateLabel(now).toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: VaultColors.mutedInk,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 4),
          Text(_greeting(now), style: theme.textTheme.headlineMedium),
          const SizedBox(height: 20),

          // Companion card
          VaultCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: VaultColors.secondarySurface,
                      child: Icon(Icons.person_outline,
                          color: VaultColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Text('Nyx', style: theme.textTheme.titleLarge),
                    const SizedBox(width: 8),
                    const StatusPill(label: 'Confidante'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Empathetic · Unfiltered & Calm',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: VaultColors.mutedInk),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: VaultColors.secondarySurface,
                    borderRadius: BorderRadius.circular(VaultRadius.control),
                  ),
                  child: Text(
                    'Companion is offline until the AI phase',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: VaultColors.mutedInk),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: FilledButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text('Talk to Nyx'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: IconButton.outlined(
                        onPressed: null,
                        icon: const Icon(Icons.mic_none_outlined),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'PRIVATE TOOLS',
            style: theme.textTheme.labelSmall?.copyWith(
              color: VaultColors.mutedInk,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: PrivateToolTile(
                  icon: Icons.edit_note,
                  label: 'Write\nSecret',
                  onTap: () => _comingSoon(context, 'Write Secret', 'Phase 2'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: PrivateToolTile(
                  icon: Icons.mic_none_outlined,
                  label: 'Voice\nNote',
                  onTap: () => _comingSoon(context, 'Voice Note', 'Phase 6'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: PrivateToolTile(
                  icon: Icons.waves,
                  label: 'Live\nVoice',
                  onTap: () => _comingSoon(context, 'Live Voice', 'Phase 6'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: PrivateToolTile(
                  icon: Icons.face_outlined,
                  label: 'Avatar\nStudio',
                  onTap: () => _comingSoon(context, 'Avatar Studio', 'Phase 3'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            'CONFIDENTIAL RECORD',
            style: theme.textTheme.labelSmall?.copyWith(
              color: VaultColors.mutedInk,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 12),
          VaultCard(
            child: Column(
              children: [
                const Icon(Icons.shield_outlined,
                    size: 32, color: VaultColors.secondary),
                const SizedBox(height: 12),
                Text('No entries yet', style: theme.textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  'Your first private entry will appear here.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: VaultColors.mutedInk),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          VaultCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UNBURDEN YOUR DAY',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: VaultColors.mutedInk,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '“Did someone take credit for your work today, or are you '
                  'holding back something you should have said?”',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        _comingSoon(context, 'Private answers', 'Phase 4'),
                    child: const Text('Answer in Private →'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
