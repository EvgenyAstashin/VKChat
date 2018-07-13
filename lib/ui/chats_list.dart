import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/ui/items/conversation_item.dart';

class ChatsListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {

  ConversationHandler conversationHandler = new ConversationHandler();

  Widget mainWidget = new CircularProgressIndicator();

  @override
  void initState() {
    conversationHandler.getConversations(success, error);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: mainWidget);
  }

  void success() {
    setState(() {
      mainWidget = new ListView.builder(
          itemCount: conversationHandler.count,
          itemBuilder: (BuildContext context, int index) {
            Conversation conversation = conversationHandler.conversations.elementAt(index);
            if(index == conversationHandler.conversations.length - 1)
              conversationHandler.getConversations(s, e);
            return new ConversationItem(conversation, conversationHandler);
          }
      );



//      mainWidget = new ListView(
//          children: conversationHandler.conversations.map((Conversation conversation) {
//            return new ConversationItem(conversation, conversationHandler);
//          }).toList());
    });
  }

  void error() {
    print('error');
  }

  void s() {}

  void e() {}
}