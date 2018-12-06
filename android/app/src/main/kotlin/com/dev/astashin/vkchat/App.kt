package com.dev.astashin.vkchat

import com.google.firebase.iid.FirebaseInstanceId
import com.vk.sdk.VKSdk
import io.flutter.app.FlutterApplication

class App : FlutterApplication() {



    override fun onCreate() {
        super.onCreate()
        VKSdk.customInitialize(this, 6481244,"5.85")
    }
}