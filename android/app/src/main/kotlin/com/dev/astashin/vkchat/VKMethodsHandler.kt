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


class VKMethodsHandler(private val activity: Activity) : MethodChannel.MethodCallHandler {

    companion object {
        const val CHANNEL = "vk_plugin"

        const val LOGIN_METHOD = "login"

        const val GET_FRIENDS = "friends"

        const val GET_USERS_INFO = "users_info"

        const val GET_CONVERSATIONS = "conversations"

        const val GET_ACCOUNT_INFO = "account_info"

        const val GET_MESSAGES_HISTORY = "messages_history"

        const val GET_CHAT = "chat"
    }

    private var token: VKAccessToken? = null
    private var methodCall: MethodCall? = null
    private var methodResult: MethodChannel.Result? = null

    override fun onMethodCall(p0: MethodCall?, p1: MethodChannel.Result?) {
        this.methodCall = p0
        this.methodResult = p1

        if (p0?.method == LOGIN_METHOD)
            login(p1)
        if (p0?.method == GET_FRIENDS)
            getFriends(p1)
        if (p0?.method == GET_USERS_INFO)
            getUsersInfo(p0, p1)
        if (p0?.method == GET_CONVERSATIONS)
            getConversations(p0, p1)
        if (p0?.method == GET_ACCOUNT_INFO)
            getAccountInfo(p1)
        if(p0?.method == GET_MESSAGES_HISTORY)
            getMessages(p0, p1)
        if(p0?.method == GET_CHAT)
            getChat(p0, p1)
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

    private fun login(methodResult: MethodChannel.Result?) {
        if(VKSdk.isLoggedIn()) {
            methodResult?.success(true)
        } else {
            VKSdk.login(activity, "messages")
        }
    }

    private fun getFriends(methodResult: MethodChannel.Result?) {
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

    private fun getUsersInfo(p0: MethodCall?, methodResult: MethodChannel.Result?) {
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

    private fun getConversations(p0: MethodCall?, methodResult: MethodChannel.Result?) {
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

    private fun getMessages(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().getHistory(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
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

    private fun getAccountInfo(methodResult: MethodChannel.Result?) {
        val request = VKApi.account().profileInfo;
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

    private fun getChat(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().getChat(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
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