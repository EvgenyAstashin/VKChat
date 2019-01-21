import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/ui/items/message/attachments/attachments.dart';
import 'package:vk_chat/ui/items/message/message.dart';

class AvatarUserMessage extends MessageWidget {

  final EdgeInsets margin;

  AvatarUserMessage(
      {Message message, HistoryHandler handler, EdgeInsets margin})
      : assert(message != null),
        assert(handler != null),
        margin =
            margin != null ? margin : EdgeInsets.fromLTRB(5.0, 2.5, 100.0, 2.5),
        super(message, handler);

  @override
  Widget build(BuildContext context) {
    Profile user = handler.getProfile(message.fromId);
    return Container(
      margin: margin,
      child: Row(
        children: <Widget>[
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
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
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(user.avatar)))),
                          Text(
                            "${user.firstName} ${user.lastName}",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      buildDisplacedMessage(),
                      buildFWDMessage(),
                      Attachments(message.attachments),
                      Text(getDate(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 100, 100, 100)))
                    ],
                  )))
        ],
      ),
    );
  }

  Widget buildDisplacedMessage() {
    if (message.text != null && message.text.length != 0)
      return Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: buildMessage());
    else
      return emptyView();
  }
}
