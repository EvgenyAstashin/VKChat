package com.dev.astashin.vkchat

import com.google.firebase.messaging.RemoteMessage

import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

class FirebaseMessagingService : FlutterFirebaseMessagingService() {

    private lateinit var notificationManager: VkNotificationManager

    override fun onCreate() {
        super.onCreate()
        notificationManager = VkNotificationManager(this)
    }

    override fun onMessageReceived(remoteMessage: RemoteMessage?) {
        super.onMessageReceived(remoteMessage)
        if(!MainActivity.isResumed) {
            notificationManager.pushReceived(this, remoteMessage)
        }
    }
}
