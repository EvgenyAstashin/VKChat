import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/profile.dart';

class VK {
  static const platform = const MethodChannel('vk_plugin');

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

  Future<List<Profile>> getFriendsInfo(List userIds) async {
    try {
      List<String> fields = new List();
      fields.add("photo_100");
      String jsonStr = await platform.invokeMethod(
          "friends_info", {"user_ids": userIds, "fields": fields});
      Map<String, dynamic> map = json.decode(jsonStr);
      return Profile.parseList(map['response']);
    } on PlatformException catch (e) {
      return new List();
    }
  }

  Future<Map<String, dynamic>> getConversations(int offset) async {
      List<String> fields = new List();
      fields.add("profile");
      fields.add("photo_100");
      String jsonStr = await platform.invokeMethod("conversations",{"fields": fields, "extended": 1, "offset": offset});
      return json.decode(jsonStr)['response'];
  }
}
