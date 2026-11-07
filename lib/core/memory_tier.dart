/// Degradation tiers from the GossipVault architecture.
enum Tier { full, text, companionLight, diaryOnly }

/// Snapshot of device memory, in megabytes.
class MemorySnapshot {
  final int availMb;
  final int totalMb;
  final bool lowRamDevice;

  const MemorySnapshot({
    required this.availMb,
    required this.totalMb,
    required this.lowRamDevice,
  });

  /// Below this many available MB we start degrading. Scales with device size:
  /// ~400 MB on 4 GB-class phones, ~1000 MB on 6 GB-class phones.
  int get floorMb => totalMb >= 5500 ? 1000 : 400;
}

/// Pure function so the thresholds can be unit-tested without a device.
Tier resolveTier(MemorySnapshot m, {bool voiceAvailable = true}) {
  if (m.availMb < m.floorMb ~/ 2) return Tier.diaryOnly;
  if (m.availMb < m.floorMb) return Tier.companionLight;
  if (m.lowRamDevice || !voiceAvailable) return Tier.text;
  return Tier.full;
}
