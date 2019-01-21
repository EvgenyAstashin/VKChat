import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/ui/chat.dart';
import 'package:vk_chat/vk/vk.dart';

class ConversationItem extends StatefulWidget {
  final Conversation _conversation;

  ConversationItem(Conversation conversation)
      : _conversation = conversation,
        super(key: new ObjectKey(conversation));

  @override
  State<StatefulWidget> createState() {
    return new ConversationItemState(_conversation);
  }
}

class ConversationItemState extends State<ConversationItem> {
  Conversation conversation;
  ConversationHandler handler = VK().getConversationHandler();

  ConversationItemState(this.conversation);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Container(
          width: 40.0,
          height: 40.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: handler
                      .getConversationAvatarProvider(conversation.getId())))),
      title: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(
            handler.getConversationTitle(conversation.getId()),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
        ],
      ),
      subtitle: _buildLastMessage(),
      trailing: new Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(_getOnline(),
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(0, 0, 255, 127)))),
          Text(_getDate(), style: TextStyle(fontSize: 12))
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatPage(conversation, handler)),
        );
      },
    );
  }

  String _getOnline() {
    if (conversation.conversationInfo.peer.isUser()) {
      Profile profile = handler.profiles[conversation.getLocalId()];
      if (profile.online == 1) return VkChatLocalizations.get('online');
    }
    return "";
  }

  String _getDate() {
    DateTime messageDate = DateTime.fromMillisecondsSinceEpoch(
        conversation.lastMessage.date * 1000);
    DateTime now = DateTime.now();
    if (messageDate.year == now.year) {
      if (messageDate.month == now.month && messageDate.day == now.day) {
        return new DateFormat.Hm().format(messageDate);
      } else {
        return new DateFormat.MMMd().format(messageDate);
      }
    } else {
      return new DateFormat.y().format(messageDate);
    }
  }

  Widget _buildLastMessage() {
    if (conversation.conversationInfo.peer.isUser() ||
        conversation.conversationInfo.peer.isGroup() ||
        conversation.conversationInfo.peer.isEmail()) {
      if (conversation.conversationInfo.peer.localId ==
          conversation.lastMessage.fromId) {
        return _buildSimpleMessage(conversation.lastMessage.text);
      } else {
        if (handler.profiles[conversation.lastMessage.fromId] != null)
          return _buildMessageWithAvatar(
              handler.profiles[conversation.lastMessage.fromId].avatar,
              conversation.lastMessage.text);
      }
    } else if (conversation.conversationInfo.peer.isChat()) {
      return _buildMessageWithAvatar(
          handler.profiles[conversation.lastMessage.fromId].avatar,
          conversation.lastMessage.text);
    }
    return new Text('', overflow: TextOverflow.ellipsis, maxLines: 1);
  }

  Widget _buildMessageWithAvatar(String avatarUrl, String message) {
    return new Row(
      children: <Widget>[
        new Container(
            width: 20.0,
            height: 20.0,
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill, image: new NetworkImage(avatarUrl)))),
        new Expanded(child: _buildSimpleMessage(conversation.lastMessage.text))
      ],
    );
  }

  Widget _buildSimpleMessage(String message) {
    return new Text(message, overflow: TextOverflow.ellipsis, maxLines: 1);
  }
}
