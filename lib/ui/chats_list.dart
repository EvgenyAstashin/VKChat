import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/ui/items/conversation_item.dart';
import 'package:vk_chat/vk/vk.dart';

class ChatsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {

  Widget mainWidget = new CircularProgressIndicator();
  VK vk = VK();
  ConversationHandler handler;

  @override
  void initState() {
    handler = vk.getConversationHandler();
    handler.getConversations(success, error);
    registerEventListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: mainWidget);
  }

  void success() {
    setState(() {
      List<Conversation> conversations = handler.getConversationsList();
      mainWidget = new ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, int index) {

            Conversation conversation =
            conversations.elementAt(index);
            if (index == conversations.length - 1)
              handler.getConversations(success, e);
            return new ConversationItem(conversation);
          });
    });
  }

  void error() {
    print('error');
  }

  void s() {}

  void e() {}

  void registerEventListener() {
    vk.getBus().on<Message>().listen((message) {
      success();
    });
  }
}
