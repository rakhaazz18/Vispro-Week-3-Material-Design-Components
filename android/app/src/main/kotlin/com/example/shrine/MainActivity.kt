package com.example.shrine

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
	private val CHANNEL = "app.channel.shared.data"

	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)
		val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
		// Respond to Dart requests for the initial link
		channel.setMethodCallHandler { call, result ->
			if (call.method == "getInitialLink") {
				result.success(intent?.dataString)
			} else {
				result.notImplemented()
			}
		}
	}

	override fun onNewIntent(intent: Intent) {
		super.onNewIntent(intent)
		// Forward runtime intents to Dart
		val engine = flutterEngine ?: return
		try {
			val channel = MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL)
			intent.dataString?.let { channel.invokeMethod("newLink", it) }
		} catch (e: Exception) {
			// ignore if engine not yet available
		}
	}
}
