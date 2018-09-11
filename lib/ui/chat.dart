import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/email.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/group.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/ui/items/message/message_item.dart';
import 'package:vk_chat/vk/vk.dart';

class ChatPage extends StatefulWidget {
  Conversation _conversation;
  ConversationHandler _handler;

  ChatPage(this._conversation, this._handler);

  @override
  State<StatefulWidget> createState() =>
      _ChatPageState(_conversation, _handler);
}

class _ChatPageState extends State<ChatPage> {
  Conversation conversation;
  ConversationHandler conversationHandler;
  HistoryHandler historyHandler;
  Profile currentUser;
  Chat chat;
  VK vk;

  Widget mainWidget;

  final myController = TextEditingController();
  ScrollController _scrollController = new ScrollController();

  _ChatPageState(this.conversation, this.conversationHandler);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: _getTitleWithImage(),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
                child: Container(
                    color: Color.fromARGB(255, 50, 50, 50), child: ListView.builder(
    itemCount: historyHandler.messages.length,
      reverse: true,
      itemBuilder: (BuildContext context, int index) {
        return MessageItem(
            historyHandler.messages.elementAt(index), currentUser, chat);
      },
      controller: _scrollController,))),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: new EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Сообщение'),
                          controller: myController,
                        ))),
                IconButton(icon: new Icon(Icons.send), onPressed: sendMessage),
              ],
            )
          ],
        ));
  }

  @override
  void initState() {
        vk = VK.getInstance();
    currentUser = vk.currentUser;
    mainWidget = Center(
      child: CircularProgressIndicator(),
    );
    historyHandler = new HistoryHandler(conversation.conversationInfo.peer.id);
    if (conversation.conversationInfo.peer.isChat()) {
      vk.getChat(conversation.conversationInfo.peer.localId).then(
          (Chat chat) {
        this.chat = chat;
        historyHandler.getMessages(success, error);
      }, onError: error);
    } else {
      historyHandler.getMessages(success, error);
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
        historyHandler.getMessages(success, error);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void success() {
    setState((){});
  }

  void error() {
    print('error');
  }

  Widget _getTitleWithImage() {
    return Row(
      children: <Widget>[
        Container(
            width: 35.0,
            height: 35.0,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill, image: _getAvatarWidget()))),
        Text(_getTitle())
      ],
    );
  }

  String _getTitle() {
    if (conversation.conversationInfo.peer.isUser()) {
      Profile profile = conversationHandler
          .profiles[conversation.conversationInfo.peer.localId];
      return "${profile.firstName} ${profile.lastName}";
    } else if (conversation.conversationInfo.peer.isChat()) {
      return conversation.conversationInfo.chatSettings.title;
    } else if (conversation.conversationInfo.peer.isGroup()) {
      Group group = conversationHandler
          .groups[conversation.conversationInfo.peer.localId];
      return group.name;
    } else if (conversation.conversationInfo.peer.isEmail()) {
      Email email = conversationHandler
          .emails[conversation.conversationInfo.peer.localId];
      return email.address;
    }
    return "";
  }

  ImageProvider _getAvatarWidget() {
    if (conversation.conversationInfo.peer.isUser()) {
      Profile profile = conversationHandler
          .profiles[conversation.conversationInfo.peer.localId];
      return new NetworkImage(profile.avatar);
    } else if (conversation.conversationInfo.peer.isChat()) {
      String photo = conversation.conversationInfo.chatSettings.getPhoto();
      if (photo != null)
        return new NetworkImage(photo);
      else
        return new AssetImage('assets/chat.png');
    } else if (conversation.conversationInfo.peer.isGroup()) {
      Group group = conversationHandler
          .groups[conversation.conversationInfo.peer.localId];
      return new NetworkImage(group.photo);
    }
    return new NetworkImage('');
  }

  void sendMessage() {
    String text = myController.text;
    myController.clear();
    Message message = Message.createMessage(
        DateTime.now().millisecondsSinceEpoch,
        currentUser.id,
        conversation.conversationInfo.peer.id,
        text);
    setState(() {
      historyHandler.sendMessage(message);
      FocusScope.of(context).requestFocus(new FocusNode());
    });
    vk.sendMessage(conversation.conversationInfo.peer.id, text);
  }
}
