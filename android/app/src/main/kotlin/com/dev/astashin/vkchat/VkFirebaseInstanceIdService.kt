package com.dev.astashin.vkchat

import android.provider.Settings
import android.util.Log
import com.google.firebase.iid.FirebaseInstanceIdService
import com.google.firebase.iid.FirebaseInstanceId
import com.vk.sdk.api.*


class VkFirebaseInstanceIdService : FirebaseInstanceIdService() {

    override fun onTokenRefresh() {
        val refreshedToken = FirebaseInstanceId.getInstance().token
        Log.e("vk_firebase", "Refreshed token: " + refreshedToken!!)
        sendRegistrationToServer(refreshedToken)

    }

    private fun sendRegistrationToServer(refreshedToken: String) {
        (application as App).token = refreshedToken

//        val params = VKParameters()
//        params.set("token", refreshedToken)
//        params.set("settings", "{\"msg\":\"on\", \"chat\":\"on\"}")
//        params.set("device_id", Settings.Secure.getString(baseContext.getContentResolver(),
//                Settings.Secure.ANDROID_ID))
//        VKApi.account().registerDevice(params).executeWithListener(object : VKRequest.VKRequestListener() {
//            override fun onComplete(response: VKResponse) {
//                Log.e("vk_firebase", "onComplete: " + response.json.toString())
//            }
//
//            override fun onError(error: VKError) {
//                Log.e("vk_firebase", "onError: " + error.toString())
//            }
//
//            override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {
//                Log.e("vk_firebase", "attemptFailed")
//            }
//        })
    }
}