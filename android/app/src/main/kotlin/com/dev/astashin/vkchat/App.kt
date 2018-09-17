package com.dev.astashin.vkchat

import com.vk.sdk.VKSdk
import io.flutter.app.FlutterApplication

class App : FlutterApplication() {

//    lateinit var sdk: VKSdk
    var token: String? = null

    override fun onCreate() {
        super.onCreate()
        VKSdk.customInitialize(this, 6481244,"5.85");
    }
}