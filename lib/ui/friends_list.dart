import 'package:flutter/material.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/ui/items/friend_item.dart';
import 'package:vk_chat/vk/vk.dart';

class FriendsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  VK vk = VK();
  List friendIds = new List();
  List<Profile> friendsInfo = new List();
  int friends = 0;
  int friendLoaded = 0;
  Widget mainWidget = new CircularProgressIndicator();

  @override
  void initState() {
    vk.loadFriendsInfo(showFriends);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: mainWidget);
  }

  void showFriends(List<Profile> friendsInfo) {
    this.friendsInfo.addAll(friendsInfo);
    setState(() {
      mainWidget = new ListView(
          children: this.friendsInfo.map((Profile user) {
            return new FriendItem(user);
          }).toList());
    });
  }
}
