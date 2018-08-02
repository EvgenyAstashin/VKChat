import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/ui/chats_list.dart';
import 'package:vk_chat/ui/friends_list.dart';
import 'package:vk_chat/vk/vk.dart';

class HomePage extends StatefulWidget {
  String title = "Сообщения";

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentPage;
  Widget drawerHeader;
  VK vk = VK.getInstance();

  @override
  void initState() {
    vk.login((isLoggedIn) => loginResult(isLoggedIn));
    currentPage = Center(child: new CircularProgressIndicator());
    drawerHeader = Container(
      padding: const EdgeInsets.all(20.0),
      child: Center(child: new CircularProgressIndicator()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      drawer: _buildDrawer(),
      appBar: new AppBar(
        title: new Text(widget.title),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: currentPage,
    );
  }

  void loginResult(bool isLoggedIn) {
    if (isLoggedIn) {
      setState(() {
        currentPage = new ChatsListPage();
        loadLoggedUserInfo();
      });
    } else {
      exit(0);
    }
  }

  void loadLoggedUserInfo() {
    vk.getLoggedUserInfo().then((Profile profile) => showProfile(profile));
  }

  void showProfile(Profile profile) {
    setState(() {
      var fontFamily = "Roboto";
      var accountName = new Text("${profile.firstName} ${profile.lastName}",
          style: new TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: fontFamily));
      var accountPicture = Container(
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(profile.avatar)
              )
          ));

      drawerHeader = new UserAccountsDrawerHeader(
        accountName: accountName,
        accountEmail: null,
        currentAccountPicture: accountPicture,
        decoration: new BoxDecoration(color: Colors.black38),
      );
    });
  }

  Drawer _buildDrawer() {
    var messages = _buildListItem(Icons.mail, "Сообщения", _onMessagesTap);
    var friends = _buildListItem(Icons.person, "Друзья", _onFriendsTap);
    var settings = _buildListItem(Icons.settings, "Настройки", _onSettingsTap);
    var logout = _buildListItem(Icons.exit_to_app, "Выход", _onLogoutTap);

    var listView = new ListView(
        children: [drawerHeader, messages, friends, settings, logout]);

    return new Drawer(child: listView);
  }

  ListTile _buildListItem(
      IconData icon, String title, GestureTapCallback callback) {
    return new ListTile(
        leading: new Icon(icon), title: new Text(title), onTap: callback);
  }

  void _onMessagesTap() {
    setState(() {
      widget.title = "Сообщения";
      currentPage = new ChatsListPage();
      Navigator.pop(context, true);
    });
  }

  void _onFriendsTap() {
    setState(() {
      widget.title = "Друзья";
      currentPage = new FriendsListPage();
      Navigator.pop(context, true);
    });
  }

  void _onSettingsTap() {}

  void _onLogoutTap() {}
}
