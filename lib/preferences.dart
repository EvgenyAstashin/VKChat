import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vk_chat/settings.dart';

class Preferences {

  static final Preferences _preferences = new Preferences._internal();

  factory Preferences() {
    return _preferences;
  }

  Preferences._internal() {
    settings = Settings();
  }

  Settings settings;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    settings.markAsRead = prefs.getBool(Settings.MARK_AS_READED) ?? false;
    settings.enablePushNotification = prefs.getBool(Settings.PUSH_NOTIFICATION) ?? false;
  }

  Future<void> saveMarkAsRead(bool markAsRead) async {
    settings.markAsRead = markAsRead;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(Settings.MARK_AS_READED, markAsRead);
  }
}

