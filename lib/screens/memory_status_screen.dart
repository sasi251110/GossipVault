import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/memory_tier.dart';
import '../core/model_manager.dart';
import '../models/model_bootstrap.dart';
import '../theme/vault_theme.dart';
import '../widgets/model_download_card.dart';
import '../widgets/vault_widgets.dart';

/// Vault tab: device memory diagnostics and model status.
class MemoryStatusScreen extends StatefulWidget {
  const MemoryStatusScreen({super.key});

  @override
  State<MemoryStatusScreen> createState() => _MemoryStatusScreenState();
}

class _MemoryStatusScreenState extends State<MemoryStatusScreen> {
  final _models = ModelManager();
  MemorySnapshot? _snapshot;
  Tier? _tier;
  String? _error;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    try {
      final snap = await _models.memorySnapshot();
      if (!mounted) return;
      setState(() {
        _snapshot = snap;
        _tier = resolveTier(snap);
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e is PlatformException ? (e.message ?? e.code) : e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = _snapshot;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          Text('Vault', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 4),
          Text(
            'Device memory and models (spike)',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: VaultColors.mutedInk),
          ),
          const SizedBox(height: 16),
          ModelDownloadCard(controller: appModel),
          const SizedBox(height: 16),
          VaultCard(
            child: s == null
                ? Text(
                    _error == null ? 'Reading memory…' : 'Error: $_error',
                    style: theme.textTheme.bodyMedium,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _row(theme, 'Total RAM', '${s.totalMb} MB'),
                      _row(theme, 'Available RAM', '${s.availMb} MB'),
                      _row(theme, 'Low-RAM device', '${s.lowRamDevice}'),
                      _row(theme, 'Floor', '${s.floorMb} MB'),
                      const SizedBox(height: 8),
                      StatusPill(label: 'Tier: ${_tier?.name ?? '-'}'),
                    ],
                  ),
          ),
          const SizedBox(height: 16),
          VaultCard(
            child: Text(
              'Measure with:\nadb shell dumpsys meminfo com.gossipvault.gossipvault',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: VaultColors.mutedInk),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: _refresh,
              child: const Text('Refresh memory'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(ThemeData theme, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: VaultColors.mutedInk)),
          Text(value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              )),
        ],
      ),
    );
  }
}
