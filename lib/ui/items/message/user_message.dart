import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/ui/items/message/attachments/attachments.dart';
import 'package:vk_chat/ui/items/message/message.dart';

class UserMessage extends MessageWidget {

  UserMessage(Message message, HistoryHandler handler)
      : super(message, handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.5, 100.0, 2.5),
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
                      buildMessage(),
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
}
