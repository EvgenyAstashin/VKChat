import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/models/send_message_response.dart';

class VK {
  static VK _vk;

  static VK getInstance() {
    if (_vk == null) _vk = new VK();
    return _vk;
  }

  static const platform = const MethodChannel('vk_plugin');

  Profile currentUser;

  void login(void result(bool isLoggedIn)) async {
    try {
      result(await platform.invokeMethod('login'));
    } on PlatformException catch (e) {
      result(false);
    }
  }

  Future<List> getFriendIds() async {
    try {
      String jsonStr = await platform.invokeMethod('friends');
      Map<String, dynamic> map = json.decode(jsonStr);
      return map['response']['items'];
    } on PlatformException catch (e) {
      return new List();
    }
  }

  Future<List<Profile>> getUsersInfo(List userIds) async {
    try {
      List<String> fields = new List();
      fields.add("photo_100");
      String jsonStr = await platform
          .invokeMethod("users_info", {"user_ids": userIds, "fields": fields});
      Map<String, dynamic> map = json.decode(jsonStr);
      return Profile.parseList(map['response']);
    } on PlatformException catch (e) {
      return new List();
    }
  }

  Future<Profile> getLoggedUserInfo() async {
    try {
      List<String> fields = new List();
      fields.add("photo_100");
      String jsonStr = await platform
          .invokeMethod("users_info", {"fields": fields});
      Map<String, dynamic> map = json.decode(jsonStr);
      currentUser = Profile.parseList(map['response'])[0];
      return currentUser;
    } on PlatformException catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getConversations(int offset) async {
    List<String> fields = new List();
    fields.add("profile");
    fields.add("photo_100");
    String jsonStr = await platform.invokeMethod("conversations",
        {"fields": fields, "extended": 1, "offset": offset});
    return json.decode(jsonStr)['response'];
  }

  Future<Map<String, dynamic>> getHistory(int lastLoadedMessageId, int peerId) async {
    var params;
    if(lastLoadedMessageId == 0)
        params = {"peer_id": peerId};
      else
        params = {"peer_id": peerId, "start_message_id": lastLoadedMessageId};
    String jsonStr = await platform.invokeMethod("messages_history", params);
    return json.decode(jsonStr)['response'];
  }

  Future<Chat> getChat(int chatId) async {
    var params = {"chat_id": chatId, "fields":"profile, photo_100"};
    String jsonStr = await platform.invokeMethod("chat", params);
    return Chat.fromJson(json.decode(jsonStr)['response']);
  }

  Future<SendMessageResponse> sendMessage(int peerId, String message) async {
    var params = {"peer_id": peerId, "message": message};
    String jsonStr = await platform.invokeMethod("send_message", params);
    return SendMessageResponse.fromJson(json.decode(jsonStr)['response']);
  }
}
