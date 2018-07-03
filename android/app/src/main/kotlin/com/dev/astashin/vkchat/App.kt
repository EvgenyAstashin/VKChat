package com.dev.astashin.vkchat

import com.vk.sdk.VKSdk
import io.flutter.app.FlutterApplication

class App : FlutterApplication() {

    lateinit var sdk: VKSdk

    override fun onCreate() {
        super.onCreate()
        VKSdk.initialize(this)
    }
}