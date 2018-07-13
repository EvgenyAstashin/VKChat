package com.dev.astashin.vkchat

import android.app.Activity
import android.content.Intent
import com.vk.sdk.VKAccessToken
import com.vk.sdk.VKCallback
import com.vk.sdk.VKSdk
import com.vk.sdk.api.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.vk.sdk.api.VKRequest.VKRequestListener


class VKMethodsHandler(val activity: Activity) : MethodChannel.MethodCallHandler {

    companion object {
        const val CHANNEL = "vk_plugin"

        const val LOGIN_METHOD = "login"

        const val GET_FRIENDS = "friends"

        const val GET_FRIENDS_INFO = "friends_info"

        const val GET_CONVERSATIONS = "conversations"
    }

    private var token: VKAccessToken? = null
    private var methodCall: MethodCall? = null
    private var methodResult: MethodChannel.Result? = null

    override fun onMethodCall(p0: MethodCall?, p1: MethodChannel.Result?) {
        this.methodCall = p0
        this.methodResult = p1

        if (p0?.method == LOGIN_METHOD)
            login()
        if (p0?.method == GET_FRIENDS)
            getFriends()
        if (p0?.method == GET_FRIENDS_INFO)
            getFriendsInfo(p0)
        if (p0?.method == GET_CONVERSATIONS)
            getConversations(p0)
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
        if(VKSdk.isLoggedIn()) {
            methodResult?.success(true)
        } else {
            VKSdk.login(activity, "messages")
        }
    }

    private fun getFriends() {
        val params = HashMap<String, Any>()
        params["order"] = "hints"
        val request = VKApi.friends().get(VKParameters(params))
        request.executeWithListener(object : VKRequestListener() {
            override fun onComplete(response: VKResponse) {
                methodResult?.success(response.responseString)
            }

            override fun onError(error: VKError) {
                methodResult?.error("error", "error", null)
            }

            override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {
                methodResult?.error("error", "error", null)
            }
        })
    }

    private fun getFriendsInfo(p0: MethodCall?) {
        val request = VKApi.users().get(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        request.executeWithListener(object : VKRequestListener() {
            override fun onComplete(response: VKResponse) {
                methodResult?.success(response.responseString)
            }

            override fun onError(error: VKError) {
                methodResult?.error("error", "error", null)
            }

            override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {
                methodResult?.error("error", "error", null)
            }
        })
    }

    private fun getConversations(p0: MethodCall?) {
        val request = VKApi.messages().getConversations(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        request.executeWithListener(object : VKRequestListener() {
            override fun onComplete(response: VKResponse) {
                methodResult?.success(response.responseString)
            }

            override fun onError(error: VKError) {
                methodResult?.error("error", "error", null)
            }

            override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {
                methodResult?.error("error", "error", null)
            }
        })

    }
}