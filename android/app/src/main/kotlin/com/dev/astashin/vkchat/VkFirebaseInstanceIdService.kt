package com.dev.astashin.vkchat

import android.content.Context
import android.provider.Settings
import android.util.Log
import com.google.firebase.iid.FirebaseInstanceIdService
import com.google.firebase.iid.FirebaseInstanceId
import com.vk.sdk.api.*


class VkFirebaseInstanceIdService : FirebaseInstanceIdService() {

    override fun onCreate() {
        super.onCreate()
        Log.e("vk_firebase", "VkFirebaseInstanceIdService onCreate")
    }

    override fun onTokenRefresh() {
        val refreshedToken = FirebaseInstanceId.getInstance().token
        Log.e("vk_firebase", "Refreshed token: " + refreshedToken!!)
        (application as App).token = refreshedToken
//        sendRegistrationToServer(refreshedToken, baseContext)
    }

    companion object {
        fun sendRegistrationToServer(refreshedToken: String, context: Context) {

//            val params = VKParameters()
//            params.set("token", refreshedToken)
//            params.set("settings", "{\"msg\":\"on\", \"chat\":\"on\"}")
//            params.set("device_model", "android")
//            params.set("system_version", android.os.Build.VERSION.SDK_INT)
//            params.set("device_id", Settings.Secure.getString(context.getContentResolver(),
//                    Settings.Secure.ANDROID_ID))
//            VKApi.account().registerDevice(params).executeWithListener(object : VKRequest.VKRequestListener() {
//                override fun onComplete(response: VKResponse) {
//                    Log.e("vk_firebase", "onComplete: " + response.json.toString())
//                }
//
//                override fun onError(error: VKError) {
//                    Log.e("vk_firebase", "onError: " + error.toString())
//                }
//
//                override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {
//                    Log.e("vk_firebase", "attemptFailed")
//                }
//            })
        }
    }
}