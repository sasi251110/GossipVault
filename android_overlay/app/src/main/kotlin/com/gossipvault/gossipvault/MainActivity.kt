package com.gossipvault.gossipvault

import android.app.ActivityManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "gossipvault/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getMemoryInfo" -> result.success(readMemoryInfo())
                    // llama.cpp bridge is the next build step; not in the spike.
                    "loadLlm", "unloadLlm" ->
                        result.error("NOT_IMPLEMENTED", "LLM bridge not built yet", null)
                    else -> result.notImplemented()
                }
            }
    }

    private fun readMemoryInfo(): Map<String, Any> {
        val am = getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val info = ActivityManager.MemoryInfo()
        am.getMemoryInfo(info)
        val mb = 1024L * 1024L
        return mapOf(
            "availMb" to (info.availMem / mb).toInt(),
            "totalMb" to (info.totalMem / mb).toInt(),
            "lowRamDevice" to am.isLowRamDevice
        )
    }
}
