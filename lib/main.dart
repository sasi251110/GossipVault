import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/memory_tier.dart';
import 'core/model_manager.dart';

void main() {
  runApp(const GossipVaultSpikeApp());
}

class GossipVaultSpikeApp extends StatelessWidget {
  const GossipVaultSpikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GossipVault Spike',
      theme: ThemeData(colorSchemeSeed: const Color(0xFF6D4C41), useMaterial3: true),
      home: const MemoryStatusScreen(),
    );
  }
}

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
      setState(() {
        _snapshot = snap;
        _tier = resolveTier(snap);
        _error = null;
      });
    } on PlatformException catch (e) {
      setState(() => _error = e.message ?? e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _snapshot;
    return Scaffold(
      appBar: AppBar(title: const Text('GossipVault Spike')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Scenario A baseline. Measure this app with:\n'
              'adb shell dumpsys meminfo com.gossipvault.gossipvault',
            ),
            const SizedBox(height: 16),
            if (_error != null) Text('Error: $_error'),
            if (s != null) ...[
              Text('Total RAM: ${s.totalMb} MB'),
              Text('Available RAM: ${s.availMb} MB'),
              Text('Low-RAM device: ${s.lowRamDevice}'),
              Text('Floor: ${s.floorMb} MB'),
              const SizedBox(height: 8),
              Text('Resolved tier: ${_tier?.name}',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
            const SizedBox(height: 16),
            FilledButton(onPressed: _refresh, child: const Text('Refresh')),
          ],
        ),
      ),
    );
  }
}
