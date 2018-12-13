package com.dev.astashin.vkchat

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.provider.Settings
import android.util.Log
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

        const val SEND_MESSAGE = "send_message"

        const val REGISTER_PUSH = "push_registration"

        const val MARK_AS_READ = "mark_as_read"

        const val SET_ONLINE = "set_online"

        const val SET_OFFLINE = "set_offline"

        const val GET_LONG_POLL_SERVER = "get_long_poll_server"

        const val GET_MESSAGES = "get_messages";
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
            getFriends(p0, p1)
        if (p0?.method == GET_USERS_INFO)
            getUsersInfo(p0, p1)
        if (p0?.method == GET_CONVERSATIONS)
            getConversations(p0, p1)
        if (p0?.method == GET_ACCOUNT_INFO)
            getAccountInfo(p1)
        if(p0?.method == GET_MESSAGES_HISTORY)
            getMessagesHistory(p0, p1)
        if(p0?.method == GET_CHAT)
            getChat(p0, p1)
        if(p0?.method == SEND_MESSAGE)
            sendMessage(p0, p1)
        if(p0?.method == MARK_AS_READ)
            markAsRead(p0, p1)
        if(p0?.method == SET_ONLINE)
            setOnline(p0, p1)
        if(p0?.method == SET_OFFLINE)
            setOffline(p0, p1)
        if(p0?.method == REGISTER_PUSH)
            registerPush(p0, p1)
        if(p0?.method == GET_LONG_POLL_SERVER)
            getLogPollServer(p0, p1)
        if(p0?.method == GET_MESSAGES)
            getMessages(p0, p1)

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
            VKSdk.login(activity, "messages,offline")
        }
    }

    private fun getFriends(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.friends().get(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun getUsersInfo(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.users().get(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun getConversations(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().getConversations(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun getMessagesHistory(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().getHistory(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun getAccountInfo(methodResult: MethodChannel.Result?) {
        val request = VKApi.account().profileInfo;
        invokeRequest(request, methodResult)
    }

    private fun getChat(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().getChat(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun sendMessage(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().send(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun markAsRead(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().markAsRead(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun setOnline(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.account().setOnline()
        invokeRequest(request, methodResult)
    }

    private fun setOffline(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.account().setOffline()
        invokeRequest(request, methodResult)
    }

    @SuppressLint("HardwareIds")
    private fun registerPush(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val params = VKParameters()
            params.set("token", p0?.argument("token"))
            params.set("settings", "{\"msg\":\"on\",\"chat\":\"on\"}")
            params.set("device_model", "android")
            params.set("system_version", android.os.Build.VERSION.SDK_INT)
            params.set("device_id", Settings.Secure.getString(activity.contentResolver,
                    Settings.Secure.ANDROID_ID))
        val request = VKApi.account().registerDevice(params)
        invokeRequest(request, methodResult)
    }

    private fun getMessages(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        val request = VKApi.messages().getById(VKParameters((p0?.arguments as MutableMap<String, Any>?)!!))
        invokeRequest(request, methodResult)
    }

    private fun getLogPollServer(p0: MethodCall?, methodResult: MethodChannel.Result?) {
        invokeRequest(VKApi.messages().longPollServer, methodResult)
    }
    private fun invokeRequest(request: VKRequest, methodResult: MethodChannel.Result?) {
        request.executeWithListener(object : VKRequestListener() {
            override fun onComplete(response: VKResponse) {
                methodResult?.success(response.responseString)
                Log.e("vk_firebase", "onComplete: " + response.json.toString())
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