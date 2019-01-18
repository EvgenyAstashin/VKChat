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

class _ChatsListPageState extends State<ChatsListPage> with WidgetsBindingObserver {

  Widget mainWidget = new CircularProgressIndicator();
  VK vk = VK();
  ConversationHandler handler;

  @override
  void initState() {
    handler = vk.getConversationHandler();
    handler.getConversations(success, error);
    WidgetsBinding.instance.addObserver(this);
    registerEventListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: mainWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    int i = 1 + 1;
    if(state == AppLifecycleState.resumed && !handler.isEmpty())
      setState(() {
        mainWidget = new CircularProgressIndicator();
        handler.clear();
        handler.getConversations(success, error);
      });
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
              handler.getConversations(success, error);
            return new ConversationItem(conversation);
          });
    });
  }

  void error() {
    print('error');
  }

  void registerEventListener() {
    vk.getBus().on<Message>().listen((message) {
      success();
    });
  }
}
