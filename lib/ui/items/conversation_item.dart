import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/email.dart';
import 'package:vk_chat/models/group.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/ui/chat.dart';
import 'package:vk_chat/vk/vk.dart';

class ConversationItem extends StatefulWidget {
  Conversation conversation;

  ConversationItem(Conversation conversation)
      : conversation = conversation,
        super(key: new ObjectKey(conversation));

  @override
  State<StatefulWidget> createState() {
    return new ConversationItemState(conversation);
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
                  fit: BoxFit.fill, image: _getAvatarWidget()))),
      title: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(
            _getTitle(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
        ],
      ),
      subtitle: _getLastMessage(),
      trailing: new Text(_getDate()),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(conversation, handler)),
        );
      },
    );
  }

  String _getDate() {
    DateTime messageDate = DateTime
        .fromMillisecondsSinceEpoch(conversation.lastMessage.date * 1000);
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

  String _getTitle() {
    if (conversation.conversationInfo.peer.isUser()) {
      Profile profile =
          handler.profiles[conversation.conversationInfo.peer.localId];
      return "${profile.firstName} ${profile.lastName}";
    } else if (conversation.conversationInfo.peer.isChat()) {
      return conversation.conversationInfo.chatSettings.title;
    } else if (conversation.conversationInfo.peer.isGroup()) {
      Group group = handler.groups[conversation.conversationInfo.peer.localId];
      return group.name;
    } else if (conversation.conversationInfo.peer.isEmail()) {
      Email email = handler.emails[conversation.conversationInfo.peer.localId];
      return email.address;
    }
    return "";
  }

  ImageProvider _getAvatarWidget() {
    if (conversation.conversationInfo.peer.isUser()) {
      Profile profile =
          handler.profiles[conversation.conversationInfo.peer.localId];
      return new NetworkImage(profile.avatar);
    } else if (conversation.conversationInfo.peer.isChat()) {
      String photo = conversation.conversationInfo.chatSettings.getPhoto();
      if (photo != null)
        return new NetworkImage(photo);
      else
        return new AssetImage('assets/chat.png');
    } else if (conversation.conversationInfo.peer.isGroup()) {
      Group group = handler.groups[conversation.conversationInfo.peer.localId];
      return new NetworkImage(group.photo);
    }
    return new NetworkImage('');
  }

  Widget _getLastMessage() {
    if (conversation.conversationInfo.peer.isUser() ||
        conversation.conversationInfo.peer.isGroup() ||
        conversation.conversationInfo.peer.isEmail()) {
      if (conversation.conversationInfo.peer.localId ==
          conversation.lastMessage.fromId) {
        return new Text(conversation.lastMessage.text,
            overflow: TextOverflow.ellipsis, maxLines: 1);
      } else {
        if (handler.profiles[conversation.lastMessage.fromId] != null)
          return new Row(
            children: <Widget>[
              new Container(
                  width: 20.0,
                  height: 20.0,
                  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(handler
                              .profiles[conversation.lastMessage.fromId]
                              .avatar)))),
              new Expanded(
                  child: new Text(conversation.lastMessage.text,
                      overflow: TextOverflow.ellipsis, maxLines: 1))
            ],
          );
      }
    } else if (conversation.conversationInfo.peer.isChat()) {
      return new Row(
        children: <Widget>[
          new Container(
              width: 20.0,
              height: 20.0,
              margin: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(handler
                          .profiles[conversation.lastMessage.fromId].avatar)))),
          new Expanded(
              child: new Text(conversation.lastMessage.text,
                  overflow: TextOverflow.ellipsis, maxLines: 1))
        ],
      );
    }
    return new Text('', overflow: TextOverflow.ellipsis, maxLines: 1);
    ;
  }
}
