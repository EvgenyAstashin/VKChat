import 'package:flutter/services.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/message.dart';
import 'dart:convert';

import 'package:vk_chat/models/profile.dart';

class VkApi {
  static const LOGIN = 'login';
  static const GET_FRIEND = 'friends';
  static const GET_USER_INFO = 'users_info';
  static const GET_CONVERSATIONS = 'conversations';
  static const GET_MESSAGE_HISTORY = 'messages_history';
  static const GET_CHAT = 'chat';
  static const GET_MESSAGES = 'get_messages';
  static const SEND_MESSAGE = 'send_message';
  static const REGISTER_PUSH = 'push_registration';
  static const MARK_AS_READ = 'mark_as_read';
  static const GET_LONG_POLL_SERVER = 'get_long_poll_server';

  static const platform = const MethodChannel('vk_plugin');

  Future<bool> login() async {
    try {
      return await platform.invokeMethod(LOGIN);
    } on PlatformException {
      return false;
    }
  }

  Future<List<Profile>> getFriends(int offset) async {
    try {
      var fields = ['photo_100', 'name'];
      String jsonStr = await platform.invokeMethod(GET_FRIEND,
          {"fields": fields, "count": 50, "offset": offset, "order":"hints"});
      Map<String, dynamic> map = json.decode(jsonStr);
      return Profile.parseList(map['response']['items']);
    } on PlatformException {
      return List();
    }
  }

  Future<List<Profile>> getUsersInfo(List userIds) async {
    try {
      var fields = ['photo_100'];
      dynamic params = userIds.length != 0
          ? {"user_ids": userIds, "fields": fields}
          : {"fields": fields};
      
      String jsonStr = await platform.invokeMethod(GET_USER_INFO, params);
      Map<String, dynamic> map = json.decode(jsonStr);
      return Profile.parseList(map['response']);
    } on PlatformException {
      return List();
    }
  }

  Future<Map<String, dynamic>> getConversations(int offset) async {
    var fields = ['photo_100', 'profile', 'online'];
    String jsonStr = await platform.invokeMethod(
        GET_CONVERSATIONS, {"fields": fields, "extended": 1, "offset": offset});
    return json.decode(jsonStr)['response'];
  }

  Future<Map<String, dynamic>> getHistory(
      int lastLoadedMessageId, int peerId) async {
    var params = {};
    params["fields"] = ['description','from','photo_100','photo_50', 'profile', 'first_name_acc', 'last_name_acc', 'sex'];
    params["peer_id"] = peerId;
    params['extended'] = 1;
    if (lastLoadedMessageId != 0)
      params["start_message_id"] = lastLoadedMessageId;
    String jsonStr = await platform.invokeMethod(GET_MESSAGE_HISTORY, params);
    return json.decode(jsonStr)['response'];
  }

  Future<Chat> getChat(int chatId) async {
    var fields = ['photo_100', 'profile'];
    var params = {"chat_id": chatId, "fields": fields};
    String jsonStr = await platform.invokeMethod(GET_CHAT, params);
    Chat chat = Chat.fromJson(json.decode(jsonStr)['response']);
    return chat;
  }

  Future<List<Message>> getMessage(List<int> ids) async {
    var params = {"message_ids": ids};
    String jsonStr = await platform.invokeMethod(GET_MESSAGES, params);
    return Message.parseList(json.decode(jsonStr)['response']['items']);
  }

  Future<int> sendMessage(int peerId, String message) async {
    var params = {"peer_id": peerId, "message": message};
    String jsonStr = await platform.invokeMethod(SEND_MESSAGE, params);
    return json.decode(jsonStr)['response'];
  }

  void registerPush(String token) async {
    var params = {"token": token};
    await platform.invokeMethod(REGISTER_PUSH, params);
  }

  void markAsRead(int peerId) async {
    var params = {"peer_id": peerId};
    await platform.invokeMethod(MARK_AS_READ, params);
  }

  Future<Map<String, dynamic>> getLongPollServer() async {
    String jsonStr = await platform.invokeMethod(GET_LONG_POLL_SERVER);
    return json.decode(jsonStr)['response'];
  }
}
