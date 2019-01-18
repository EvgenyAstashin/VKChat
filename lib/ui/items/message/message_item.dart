import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/ui/items/message/attachments/attachments.dart';
import 'package:vk_chat/ui/views/linkable_text.dart';

class MessageItem extends StatelessWidget {
  Message message;
  Profile currentUser;
  Chat chat;
  HistoryHandler historyHandler;

  MessageItem(this.message, this.currentUser, this.chat, this.historyHandler);

  @override
  Widget build(BuildContext context) {
    if (message.action != null) return buildActionMessage();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildMessage(message),
                      Attachments(message.attachments),
                      Text(_getDate(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 100, 100, 100))),
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

  Widget buildActionMessage() {
    Profile user = historyHandler.getProfile(message.fromId);
    String messageText = '';
    if (message.action.type == "chat_kick_user") {
      if (message.fromId == message.action.memberId) {
        messageText =
        "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'left_conversation' : 'left_conversation_f')}";
    } else {
        Profile kickedUser = historyHandler.getProfile(message.action.memberId);
        messageText =
        "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'chat_kicked_user' : 'chat_kicked_user_f')} ${kickedUser.firstNameAcc} ${kickedUser.lastNameAcc}";
      }
    }
    if (message.action.type == "chat_create")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'create_conversation' : 'create_conversation_f')} \"${message.action.text}\"";
    if (message.action.type == "chat_title_update")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'change_conversation_title' : 'change_conversation_title_f')} \"${message.action.text}\"";
    if (message.action.type == "chat_photo_update")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'conversation_icon_update' : 'conversation_icon_update_f')}";
    if (message.action.type == "chat_photo_remove")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'conversation_icon_remove' : 'conversation_icon_remove_f')}";
    if (message.action.type == "chat_invite_user") {
      Profile invitedUser = historyHandler.getProfile(message.action.memberId);
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'invite_user' : 'invite_user_f')} ${invitedUser.firstNameAcc} ${invitedUser.lastNameAcc}";
    }
    if (message.action.type == "chat_pin_message")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'pin_message' : 'pin_message_f')} \"${message.action.message}\"";
    if (message.action.type == "chat_unpin_message")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'unpin_message' : 'unpin_message_f')}";
    if (message.action.type == "chat_invite_user_by_link")
      messageText =
          "${user.firstName} ${user.lastName} ${VkChatLocalizations.get(user.sex != 1 ? 'invite_user_by_link' : 'invite_user_by_link_f')}";
    return Container(
        margin: EdgeInsets.all(10),
        child: Text(
          messageText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ));
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
                      _buildMessage(message),
                      Attachments(message.attachments),
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
    Profile user = chat.usersMap[message.fromId];
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
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      _buildChatMessage(message),
                      Attachments(message.attachments),
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
        return new DateFormat("HH:mm").format(messageDate);
      } else {
        return new DateFormat("HH:mm MMM d").format(messageDate);
      }
    } else {
      return new DateFormat.y().format(messageDate);
    }
  }

  Widget _buildMessage(Message message) {
    if (message.text != null && message.text.length != 0)
      return LinkableText(
        text: message.text,
        style: TextStyle(fontSize: 16.0),
      );
    else
      return _emptyView();
  }

  Widget _buildChatMessage(Message message) {
    if (message.text != null && message.text.length != 0)
      return Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: LinkableText(
            text: message.text,
            style: TextStyle(fontSize: 16.0),
          ));
    else
      return _emptyView();
  }

  Widget _emptyView() {
    return Container(width: 0.0, height: 0.0);
  }
}
