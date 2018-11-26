import 'package:flutter/material.dart';
import 'package:vk_chat/preferences.dart';
import 'package:vk_chat/ui/home.dart';
import 'package:vk_chat/vk/vk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(new MainWidget());
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<MainWidget> with WidgetsBindingObserver {
  Preferences prefs = Preferences();
  VK vk = VK();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print("vk_firebase onLaunch called");
    }, onResume: (Map<String, dynamic> msg) {
      print("vk_firebase onResume called");
    }, onMessage: (Map<String, dynamic> msg) {
      print("vk_firebase onMessage called");
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
      update(token);
    });
  }

  update(String token) {
    vk.token = token;
    print('vk_firebase token ' + token);
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
    return new MaterialApp(title: 'VKchat', home: new HomePage());
  }
}
