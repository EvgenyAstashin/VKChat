package com.dev.astashin.vkchat

import android.app.Activity
import android.content.Intent
import android.util.Log
import com.vk.sdk.VKAccessToken
import com.vk.sdk.VKCallback
import com.vk.sdk.VKSdk
import com.vk.sdk.api.VKError
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class VKMethodsHandler(val activity: Activity) : MethodChannel.MethodCallHandler {

    companion object {
        val CHANNEL = "vk_plugin"

        val LOGIN_METHOD = "login"
    }

    private var token: VKAccessToken? = null
    private var methodCall: MethodCall? = null
    private var methodResult: MethodChannel.Result? = null

    override fun onMethodCall(p0: MethodCall?, p1: MethodChannel.Result?) {
        this.methodCall = p0
        this.methodResult = p1

        if (p0?.method == LOGIN_METHOD)
            login()
    }

    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (methodCall?.method == LOGIN_METHOD)
            VKSdk.onActivityResult(requestCode, resultCode, data, object : VKCallback<VKAccessToken> {
                override fun onResult(res: VKAccessToken?) {
                    token = res
                    methodResult?.success(true)
                }

                override fun onError(error: VKError?) {
                    methodResult?.error("error", "not auth", false)
                }
            })
    }

    private fun login() {
        VKSdk.login(activity)
    }
}