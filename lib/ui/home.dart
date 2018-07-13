import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vk_chat/ui/chats_list.dart';
import 'package:vk_chat/ui/friends_list.dart';
import 'package:vk_chat/vk/vk.dart';

class HomePage extends StatefulWidget {
  String title = "Сообщения";

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentPage = new ChatsListPage();
  VK vk = new VK();

  @override
  Widget build(BuildContext context) {
    vk.login((isLoggedIn) => loginResult(isLoggedIn));

    return new Scaffold(
      drawer: _buildDrawer(),
      appBar: new AppBar(
        title: new Text(widget.title),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: currentPage,
    );
  }

  Widget loginResult(bool isLoggedIn) {
    if(isLoggedIn) {
      return new Scaffold(
        drawer: _buildDrawer(),
        appBar: new AppBar(
          title: new Text(widget.title),
          elevation: Theme
              .of(context)
              .platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: currentPage,
      );
    } else {
      exit(0);
      return new Center();
    }
  }

  Drawer _buildDrawer() {
    var header = _buildHeader();

    var messages = _buildListItem(Icons.mail, "Сообщения", _onMessagesTap);
    var friends = _buildListItem(Icons.person, "Друзья", _onFriendsTap);
    var settings = _buildListItem(Icons.settings, "Настройки", _onSettingsTap);
    var logout = _buildListItem(Icons.exit_to_app, "Выход", _onLogoutTap);

    var listView = new ListView(children: [header,
        messages,
        friends,
        settings,
        logout]);

    return new Drawer(child: listView);
  }

  Widget _buildHeader() {
    var fontFamily = "Roboto";
    var accountEmail = new Text("dnsoftindia@gmail.com",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14.0,
            fontFamily: fontFamily));
    var accountName = new Text("DN Soft India",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontFamily: fontFamily));
    var accountPicture = new CircleAvatar(
        child: new Icon(Icons.person_outline),
        backgroundColor: Theme.of(context).accentColor);

    return new UserAccountsDrawerHeader(
      accountEmail: accountEmail,
      accountName: accountName,
      currentAccountPicture: accountPicture,
      decoration: new BoxDecoration(color: Theme.of(context).cardColor),
    );
  }

  ListTile _buildListItem(IconData icon, String title, GestureTapCallback callback) {
    return new ListTile(
        leading: new Icon(icon),
        title: new Text(title),
        onTap: callback);
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

  void _onSettingsTap() {

  }

  void _onLogoutTap() {

  }
}
