import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/preferences.dart';
import 'package:vk_chat/ui/home.dart';
import 'package:vk_chat/vk/vk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<App>{

  Preferences prefs = Preferences();
  VK vk = VK();
  Widget currentPage = Center(child: new CircularProgressIndicator());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    vk.login((isLoggedIn) => _loginResult(isLoggedIn));
  }

  @override
  Widget build(BuildContext context) {
    prefs.load();
    return MaterialApp(
        localizationsDelegates: [
          VkChatLocalizationsDelegate()
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('ru', '')
        ],
        home: currentPage
    );
  }

  void _registerPush() {
    _firebaseMessaging.configure(
        onLaunch: (Map<String, dynamic> msg) {},
        onResume: (Map<String, dynamic> msg) {},
        onMessage: (Map<String, dynamic> msg) {});
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true,
            alert: true,
            badge: true
        )
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {});
    _firebaseMessaging.getToken().then((token) {
      _update(token);
    });
  }

  void _update(String token) {
    vk.registerPush(token);
  }

  void _loginResult(bool isLoggedIn) {
    if (isLoggedIn) {
      setState(() {
        _registerPush();
        currentPage = new MaterialApp(title: VkChatLocalizations.get('app_name'), home: new HomePage());
      });
    } else {
      exit(0);
    }
  }
}