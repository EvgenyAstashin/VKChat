import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';

class MessageItem extends StatelessWidget {
  Message message;
  Profile currentUser;
  Chat chat;

  MessageItem(this.message, this.currentUser, this.chat);

  @override
  Widget build(BuildContext context) {
    return message.fromId == currentUser.id
        ? buildCurrentUsersMessage()
        : buildMessage();
  }

  Widget buildCurrentUsersMessage() {
    return Container(
      margin: EdgeInsets.fromLTRB(100.0, 2.5, 5.0, 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        message.text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(_getDate(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 100, 100, 100)))
                    ],
                  )))
        ],
      ),
    );
  }

  Widget buildMessage() {
    if (chat != null) return buildChatMessage();
    return buildUserMessage();
  }

  Widget buildUserMessage() {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.5, 100.0, 2.5),
      child: Row(
        children: <Widget>[
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message.text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(_getDate(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 100, 100, 100)))
                    ],
                  )))
        ],
      ),
    );
  }

  Widget buildChatMessage() {
    Profile user = chat.users[message.fromId];
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.5, 100.0, 2.5),
      child: Row(
        children: <Widget>[
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          Container(
                              width: 25.0,
                              height: 25.0,
                              margin: EdgeInsets.only(right: 10.0),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(user.avatar)))),
                          Text(
                                "${user.firstName} ${user.lastName}",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            message.text,
                            style: TextStyle(fontSize: 16.0),
                          )),
                      Text(_getDate(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 100, 100, 100)))
                    ],
                  )))
        ],
      ),
    );
  }

  String _getDate() {
    DateTime messageDate =
        DateTime.fromMillisecondsSinceEpoch(message.date * 1000);
    DateTime now = DateTime.now();
    if (messageDate.year == now.year) {
      if (messageDate.month == now.month && messageDate.day == now.day) {
        return new DateFormat.Hm().format(messageDate);
      } else {
        return new DateFormat("H:m MMM d").format(messageDate);
      }
    } else {
      return new DateFormat.y().format(messageDate);
    }
  }
}
