import 'package:flutter/material.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/email.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/group.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/preferences.dart';
import 'package:vk_chat/ui/items/message/message_item.dart';
import 'package:vk_chat/vk/vk.dart';

class ChatPage extends StatefulWidget {
  final Conversation _conversation;
  final ConversationHandler _handler;

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
  bool markAsRead;

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
                    color: Color.fromARGB(255, 50, 50, 50),
                    child: ListView.builder(
                      itemCount: historyHandler != null ? historyHandler.messages.length : 0,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        return MessageItem(
                            historyHandler.messages.elementAt(index),
                            currentUser,
                            chat,
                            historyHandler);
                      },
                      controller: _scrollController,
                    ))),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: new EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: VkChatLocalizations.get('message')),
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
    vk = VK();
    markAsRead = Preferences().settings.markAsRead;
    currentUser = vk.currentUser;
    mainWidget = Center(
      child: CircularProgressIndicator(),
    );

    vk.getHistoryHandler(conversation, (historyHandler, chat) {
      this.historyHandler = historyHandler;
      this.chat = chat;
      this.historyHandler.getMessages(success, error);
    }, error);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
        historyHandler.getMessages(success, error);
    });
    registerEventListener();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void success() {
    if (markAsRead) vk.markAsRead(conversation.conversationInfo.peer.id);
    setState(() {});
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
        Expanded(child: Text(_getTitle(), overflow: TextOverflow.ellipsis))
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
        DateTime.now().millisecondsSinceEpoch ~/ 1000,
        currentUser.id,
        conversation.conversationInfo.peer.id,
        text);
    setMessage(message, true);
    vk.sendMessage(message);
  }

  void registerEventListener() {
    vk.getBus().on<Message>().listen((message) {
      setMessage(message, false);
    });
  }

  void setMessage(Message message, bool outgoing) {
    if (message.peerId == conversation.conversationInfo.peer.id &&
        (message.fromId != currentUser.id || outgoing)) {
      setState(() {
        historyHandler.setMessage(message);
        FocusScope.of(context).requestFocus(new FocusNode());
      });
    }
  }
}
