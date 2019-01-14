package com.dev.astashin.vkchat

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import android.support.v4.app.NotificationCompat
import android.support.v4.app.NotificationManagerCompat
import android.text.TextUtils
import com.google.firebase.messaging.RemoteMessage
import com.google.gson.Gson
import com.vk.sdk.api.*
import com.bumptech.glide.Glide
import com.bumptech.glide.request.target.SimpleTarget
import com.bumptech.glide.request.RequestOptions
import com.bumptech.glide.request.transition.Transition
import java.lang.Exception

class VkNotificationManager(context: Context) {

    companion object {

        const val CHANNEL_ID = "vk_message_channel"
        val messages = HashMap<Int, LinkedHashMap<Int, Message>>()
        val profiles = HashMap<Int, Profile>()
        val conversations = HashMap<Int, Conversation>()

        fun removeAllNotifications(context: Context) {
            val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.cancelAll()
            messages.clear()
            profiles.clear()
            conversations.clear()
        }
    }

    init {
        buildChannel(context)
    }

    fun pushReceived(context: Context, remoteMessage: RemoteMessage?) {
        try {
            val id = remoteMessage!!.data["id"]
            if (isIdValid(id)) {
                val idParts = splitId(id)
                val conversationRequest: VKRequest? = if (idParts[0] == "chat") buildConversationRequest(idParts[1]) else null
                val messageRequest = buildMessageRequest(idParts[2])
                if (conversationRequest != null)
                    loadConversationWithMessage(context, idParts[1], conversationRequest, messageRequest)
                else
                    loadMessage(context, messageRequest)
            }
        } catch (e: Exception) {
        }
    }

    private fun isIdValid(id: String?): Boolean {
        return id != null && (id.contains("chat") || id.contains("msg"))
    }

    private fun splitId(id: String?): List<String> {
        return id!!.split("_")
    }

    private fun buildMessageRequest(messageId: String): VKRequest {
        val params = mapOf(
                Pair("message_ids", messageId),
                Pair("fields", "profile,photo_100"),
                Pair("extended", 1))
        return VKApi.messages().getById(VKParameters(params))
    }

    private fun buildConversationRequest(conversationId: String): VKRequest {
        val params = mapOf(
                Pair("peer_ids", conversationId),
                Pair("fields", "photo_100"),
                Pair("extended", 1))
        return VKApi.messages().getConversationsById(VKParameters(params))
    }

    private fun loadMessage(context: Context, messageRequest: VKRequest) {
        messageRequest.executeWithListener(object : VKRequest.VKRequestListener() {
            override fun onComplete(response: VKResponse) {
                messageReceived(context, response)
            }

            override fun onError(error: VKError) {}

            override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {}
        })
    }

    private fun loadConversationWithMessage(context: Context,
                                            conversationId: String,
                                            conversationRequest: VKRequest,
                                            messageRequest: VKRequest) {
        if (conversations.containsKey(conversationId.toInt()))
            loadMessage(context, messageRequest)
        else
            conversationRequest.executeWithListener(object : VKRequest.VKRequestListener() {
                override fun onComplete(response: VKResponse) {
                    conversationReceived(context, response, messageRequest)
                }

                override fun onError(error: VKError) {}

                override fun attemptFailed(request: VKRequest, attemptNumber: Int, totalAttempts: Int) {}
            })
    }

    private fun messageReceived(context: Context, response: VKResponse) {
        val messageResponse = parseMessageResponse(response)
        val peerId = saveMessageData(messageResponse)
        showNotification(context, peerId)
    }

    private fun conversationReceived(context: Context, response: VKResponse, messageRequest: VKRequest) {
        val conversationResponse = parseConversationResponse(response)
        saveConversation(conversationResponse)
        loadMessage(context, messageRequest)
    }

    private fun parseConversationResponse(response: VKResponse): ConversationResponse {
        val gson = Gson()
        return gson.fromJson<ConversationResponse>(response.json["response"].toString(), ConversationResponse::class.java)
    }

    private fun saveConversation(conversationResponse: ConversationResponse) {
        val conversation = conversationResponse.conversations[0]
        conversations[conversation.peer.id] = conversation
    }

    private fun saveMessageData(messageResponse: MessageResponse): Int {
        val profile = messageResponse.profiles[0]
        val message = messageResponse.messages[0]
        saveProfile(profile)
        saveMessage(message)
        return message.peerId
    }

    private fun saveMessage(message: Message) {
        var messageMap = messages[message.peerId]
        if (messageMap != null) {
            messageMap[message.id] = message
        } else {
            messageMap = linkedMapOf(Pair(message.id, message))
            messages[message.peerId] = messageMap
        }
    }

    private fun saveProfile(profile: Profile) {
        profiles[profile.id] = profile
    }

    private fun parseMessageResponse(response: VKResponse): MessageResponse {
        val gson = Gson()
        return gson.fromJson<MessageResponse>(response.json["response"].toString(), MessageResponse::class.java)
    }

    private fun showNotification(context: Context, peerId: Int) {
        val intent = Intent(context, MainActivity::class.java)
        val pendingIntent: PendingIntent = PendingIntent.getActivity(context, 0, intent, 0)

        val messagesMap = messages[peerId]
        var profile = profiles[messagesMap!!.values.first().fromId]
        val conversation = conversations[peerId]

        val messageStyle = NotificationCompat.MessagingStyle("")
        if (conversation == null) {
            messageStyle.conversationTitle = "${profile!!.firstName} ${profile.lastName}"
            messagesMap.values.forEach { message ->
                messageStyle.addMessage(message.text, message.date, null)
            }
        } else {
            messageStyle.conversationTitle = conversation.settings.title
            messagesMap.values.forEach { message ->
                profile = profiles[message.fromId]
                messageStyle.addMessage(message.text, message.date, "${profile!!.firstName} ${profile!!.lastName}")
            }
        }

        val mBuilder = NotificationCompat.Builder(context, CHANNEL_ID)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setStyle(messageStyle)
                .setContentIntent(pendingIntent)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)

        var url: String? = null
        if(conversation == null)
            url = profile!!.photo
        else if (!TextUtils.isEmpty(conversation.settings.photo?.photo)) {
            url = conversation.settings.photo?.photo
        }

        if(url != null) {
            Glide.with(context)
                    .asBitmap()
                    .load(url)
                    .apply(RequestOptions.circleCropTransform())
                    .into(object : SimpleTarget<Bitmap>() {
                        override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                            mBuilder.setLargeIcon(resource)
                            with(NotificationManagerCompat.from(context)) {
                                notify(peerId, mBuilder.build())
                            }
                        }
                    })
        } else {
            val icon = BitmapFactory.decodeResource(context.resources, R.drawable.chat)
            mBuilder.setLargeIcon(icon)
            with(NotificationManagerCompat.from(context)) {
                notify(peerId, mBuilder.build())
            }
        }
    }

    private fun buildChannel(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "VK Messages"
            val descriptionText = "Messages from Vkontakte"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel(CHANNEL_ID, name, importance).apply {
                description = descriptionText
            }
            val notificationManager: NotificationManager =
                    context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }

}