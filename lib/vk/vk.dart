import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vk_chat/models/profile.dart';

class VK {
  static VK _vk;

  static VK getInstance() {
    if (_vk == null) _vk = new VK();
    return _vk;
  }

  static const platform = const MethodChannel('vk_plugin');

  void login(void result(bool isLoggedIn)) async {
    try {
      print('login');
      result(await platform.invokeMethod('login'));
    } on PlatformException catch (e) {
      result(false);
    }
  }

  void getAccountInfo() async {
    String jsonStr = await platform.invokeMethod('account_info');
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
      return Profile.parseList(map['response'])[0];
    } on PlatformException catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getConversations(int offset) async {
    List<String> fields = new List();
    fields.add("profile");
    fields.add("photo_100");
    String jsonStr = await platform.invokeMethod(
        "conversations", {"fields": fields, "extended": 1, "offset": offset});
    return json.decode(jsonStr)['response'];
  }
}
