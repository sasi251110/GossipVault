import 'package:flutter_test/flutter_test.dart';
import 'package:gossipvault/core/memory_tier.dart';

void main() {
  test('6 GB-class device with plenty of memory gets full tier', () {
    const m = MemorySnapshot(availMb: 2500, totalMb: 6000, lowRamDevice: false);
    expect(resolveTier(m), Tier.full);
  });

  test('low-RAM device is capped at text tier', () {
    const m = MemorySnapshot(availMb: 2500, totalMb: 3900, lowRamDevice: true);
    expect(resolveTier(m), Tier.text);
  });

  test('voice unavailable is capped at text tier', () {
    const m = MemorySnapshot(availMb: 2500, totalMb: 6000, lowRamDevice: false);
    expect(resolveTier(m, voiceAvailable: false), Tier.text);
  });

  test('below floor drops to companion-light', () {
    const m = MemorySnapshot(availMb: 800, totalMb: 6000, lowRamDevice: false);
    expect(resolveTier(m), Tier.companionLight);
  });

  test('4 GB-class device uses lower floor', () {
    const m = MemorySnapshot(availMb: 350, totalMb: 3900, lowRamDevice: false);
    expect(resolveTier(m), Tier.companionLight);
  });

  test('critically low memory drops to diary-only', () {
    const m = MemorySnapshot(availMb: 150, totalMb: 3900, lowRamDevice: false);
    expect(resolveTier(m), Tier.diaryOnly);
  });
}
