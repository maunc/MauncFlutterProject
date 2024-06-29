package com.example.maunc_flutter_project

import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val message = flutterEngine.dartExecutor.binaryMessenger
        val methodChannel = MethodChannel(message, "android_channel_name")

        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "android_channel_name" -> {
                    result.success("结果来了")
                }
                else -> {
                    result.error("404","ErrorMessage",null)
                }
            }
        }
    }
}
