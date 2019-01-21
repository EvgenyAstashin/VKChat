import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/ui/items/message/avatar_message.dart';

class FwdMessage extends StatelessWidget {

  final List<Message> messages;
  final HistoryHandler historyHandler;

  FwdMessage(this.messages, this.historyHandler);

  @override
  Widget build(BuildContext context) {
    if (messages != null) {
      List<Widget> widgets = List();
      messages.forEach((message) => widgets.add(_buildMessage(message)));

      return Container(
          margin: const EdgeInsets.only(left: 5.0, bottom: 3.0, top: 5),
          padding: const EdgeInsets.only(left: 3.0),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide.none,
                  bottom: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(color: Colors.blueAccent, width: 3.0))),
          child: Column(children: widgets));
    }
    return emptyView();
  }

  Widget _buildMessage(Message message) {
    return AvatarUserMessage(
        message: message,
        handler: historyHandler,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0));
  }

  Widget emptyView() {
    return Container(width: 0.0, height: 0.0);
  }
}
