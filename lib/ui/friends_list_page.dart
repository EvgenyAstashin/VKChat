import 'package:flutter/material.dart';
import 'package:vk_chat/models/user.dart';
import 'package:vk_chat/ui/friend_item.dart';
import 'package:vk_chat/vk/vk.dart';

import 'dart:convert';

class FriendsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  VK vk = new VK();
  List friendIds = new List();
  List<User> friendsInfo = new List();
  int friends = 0;
  int friendLoaded = 0;
  Widget mainWidget = new CircularProgressIndicator();

  @override
  void initState() {
    vk.getFriendIds().then((List friendIds) => loadFriendsInfo(friendIds));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: mainWidget);
  }

  void loadFriendsInfo(List friendIds) {
    friendIds.add(0);
    friendIds.insert(0, 0);
    this.friendIds.addAll(friendIds);
    friends = friendIds.length;
    vk.getFriendsInfo(friendIds).then((List<User> friendsInfo) => showFriends(friendsInfo));
  }

  void showFriends(List<User> friendsInfo) {
    this.friendsInfo.addAll(friendsInfo);
    setState(() {
      mainWidget = new ListView(
          children: this.friendsInfo.map((User user) {
            return new FriendItem(user);
          }).toList());
    });
  }
}
