import 'package:flutter/material.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/models/profile.dart';

class FriendItem extends StatefulWidget {
  final Profile _user;

  FriendItem(Profile user)
      : _user = user,
        super(key: new ObjectKey(user));

  @override
  State<StatefulWidget> createState() {
    return new FriendItemState(_user);
  }
}

class FriendItemState extends State<FriendItem> {
  Profile user;

  FriendItemState(this.user);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Container(
          width: 40.0,
          height: 40.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill, image: new NetworkImage(user.avatar)))),
      title: new Row(
        children: <Widget>[
          new Expanded(child: new Text("${user.firstName} ${user.lastName}")),
        ],
      ),
      subtitle: user.online == 0
          ? null
          : Text(VkChatLocalizations.get('online'),
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(0, 0, 255, 127))),
      trailing: new IconButton(
        icon: new Icon(Icons.chat),
        onPressed: () {},
      ),
    );
  }
}
