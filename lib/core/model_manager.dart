import 'package:flutter/services.dart';

import 'memory_tier.dart';

/// Single owner of native model handles. Serializes all native calls so that
/// two model loads can never overlap.
class ModelManager {
  static const _channel = MethodChannel('gossipvault/native');

  Future<void> _queue = Future.value();

  Future<T> _serialized<T>(Future<T> Function() action) {
    final result = _queue.then((_) => action());
    _queue = result.then((_) {}, onError: (_) {});
    return result;
  }

  Future<MemorySnapshot> memorySnapshot() => _serialized(() async {
        final raw =
            await _channel.invokeMapMethod<String, dynamic>('getMemoryInfo');
        if (raw == null) {
          throw PlatformException(
              code: 'NULL', message: 'No memory info returned');
        }
        return MemorySnapshot(
          availMb: raw['availMb'] as int,
          totalMb: raw['totalMb'] as int,
          lowRamDevice: raw['lowRamDevice'] as bool,
        );
      });

  /// Not implemented in the spike. Kept so the call surface is fixed early.
  Future<void> loadLlm(String ggufPath) => _serialized(() async {
        await _channel.invokeMethod<void>('loadLlm', {'path': ggufPath});
      });

  Future<void> unloadLlm() => _serialized(() async {
        await _channel.invokeMethod<void>('unloadLlm');
      });
}
