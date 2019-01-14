package com.dev.astashin.vkchat

import com.google.gson.annotations.SerializedName

class MessageResponse(
        @SerializedName("count") var count: Int,
        @SerializedName("items") var messages: List<Message>,
        @SerializedName("profiles") var profiles: List<Profile>)

class Message(
        @SerializedName("id") var id: Int,
        @SerializedName("date") var date: Long,
        @SerializedName("from_id") var fromId: Int,
        @SerializedName("peer_id") var peerId: Int,
        @SerializedName("text") var text: String,
        @SerializedName("fwd_messages") var fwdMessages: List<Any>,
        @SerializedName("attachments") var attachments: List<Any>
)

class Profile(
        @SerializedName("id") var id: Int,
        @SerializedName("first_name") var firstName: String,
        @SerializedName("last_name") var lastName: String,
        @SerializedName("photo_100") var photo: String
)

class ConversationResponse(
        @SerializedName("count") var count: Int,
        @SerializedName("items") var conversations: List<Conversation>
)

class Conversation (
    @SerializedName("peer") var peer: Peer,
    @SerializedName("chat_settings") var settings: ChatSettings
)

class Peer(
        @SerializedName("id") var id: Int
)

class ChatSettings(
        @SerializedName("title") var title: String,
        @SerializedName("photo") var photo: Photo?
)

class Photo(
        @SerializedName("photo_100") var photo: String
)
