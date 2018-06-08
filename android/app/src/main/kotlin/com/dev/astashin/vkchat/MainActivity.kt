package com.dev.astashin.vkchat

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  val vkMethodsHandler = VKMethodsHandler(this)

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, VKMethodsHandler.CHANNEL).setMethodCallHandler(vkMethodsHandler)
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
    super.onActivityResult(requestCode, resultCode, data)
    vkMethodsHandler.onActivityResult(requestCode, resultCode, data)
  }
}
