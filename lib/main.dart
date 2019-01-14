import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/preferences.dart';
import 'package:vk_chat/ui/home.dart';
import 'package:vk_chat/vk/vk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<App> with WidgetsBindingObserver {

  Preferences prefs = Preferences();
  VK vk = VK();
  Widget currentPage = Center(child: new CircularProgressIndicator());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    vk.login((isLoggedIn) => _loginResult(isLoggedIn));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
//    if(state == AppLifecycleState.resumed)
//      vk.setOnline();
//    if(state == AppLifecycleState.paused)
//      vk.setOffline();
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
    _firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print("vk_firebase onLaunch called");
    }, onResume: (Map<String, dynamic> msg) {
      print("vk_firebase onResume called");
    }, onMessage: (Map<String, dynamic> msg) {
      print("vk_firebase onMessage called " + msg.toString());
    });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true,
            alert: true,
            badge: true
        )
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print('vk_firebase ios setting registered');
    });
    _firebaseMessaging.getToken().then((token) {
      _update(token);
    });
  }

  void _update(String token) {
    vk.registerPush(token);
    print('vk_firebase token ' + token);
  }

  void _loginResult(bool isLoggedIn) {
    if (isLoggedIn) {
      setState(() {
        _registerPush();
        currentPage = new MaterialApp(title: 'VKchat', home: new HomePage());
      });
    } else {
      exit(0);
    }
  }
}