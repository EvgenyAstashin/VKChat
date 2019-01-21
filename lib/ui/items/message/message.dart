import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/ui/items/message/fwd_message.dart';
import 'package:vk_chat/ui/widgets/linkable_text.dart';

abstract class MessageWidget extends StatelessWidget {

  final Message message;
  final HistoryHandler handler;

  MessageWidget(this.message, this.handler, );

  String getDate() {
    DateTime messageDate =
    DateTime.fromMillisecondsSinceEpoch(message.date * 1000);
    DateTime now = DateTime.now();
    if (messageDate.year == now.year) {
      if (messageDate.month == now.month && messageDate.day == now.day) {
        return DateFormat("HH:mm").format(messageDate);
      } else {
        return DateFormat("HH:mm MMM d").format(messageDate);
      }
    } else {
      return DateFormat.y().format(messageDate);
    }
  }

  Widget buildMessage() {
    if (message.text != null && message.text.length != 0)
      return LinkableText(
        text: message.text,
        style: TextStyle(fontSize: 16.0),
      );
    else
      return emptyView();
  }

  Widget buildFWDMessage() {
    if(message.fwdMessages == null)
      return emptyView();
    return FwdMessage(message.fwdMessages, handler);
  }

  Widget emptyView() {
    return Container(width: 0.0, height: 0.0);
  }
}
