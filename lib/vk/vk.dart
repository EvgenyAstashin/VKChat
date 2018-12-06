import 'package:event_bus/event_bus.dart';
import 'package:vk_chat/handlers/history_handler.dart';
import 'package:vk_chat/models/chat.dart';
import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/vk/events.dart';
import 'package:vk_chat/vk/log_poll_worker.dart';
import 'package:vk_chat/vk/vk_api.dart';
import 'package:vk_chat/handlers/conversation_handler.dart';

class VK {
  static final VK _vk = VK._internal();

  factory VK() {
    return _vk;
  }

  VK._internal() {
    _init();
  }

  VkApi _api = VkApi();
  EventBus _eventBus = new EventBus();

  ConversationHandler _conversationHandler;
  LongPollWorker _longPollWorker;

  Profile currentUser;

  EventBus getBus() {
    return _eventBus;
  }

  void login(void result(bool isLoggedIn)) async {
    _api.login().then((idLoggedIn) {
      print('loggedIn ' + idLoggedIn.toString());
      result(idLoggedIn);
      _startLongPoll();
    });
  }

  void updateOnline() async {
//    if (prefs.settings.showAsOnline) {
//      if (!_updateOnlineEnabled) _resetOnline();
//      else _updateOnlineEnabled = true;
//    } else {
//      _updateOnlineEnabled = false;
//      await platform.invokeMethod("set_offline");
//    }
  }

  void getLoggedUserInfo(void result(Profile user)) {
    if (currentUser != null) {
      result(currentUser);
    } else {
      _api.getUsersInfo(List()).then((users) {
        currentUser = users[0];
        result(currentUser);
      });
    }
  }

  void loadFriendsInfo(void result(List<Profile> users)) {
    _api.getFriendIds().then((ids) {
      _api.getUsersInfo(ids).then((users) => result(users));
    });
  }

  ConversationHandler getConversationHandler() {
    return _conversationHandler;
  }

  void getHistoryHandler(Conversation conversation,
      void result(HistoryHandler handler, Chat chat), void error()) {
    if (conversation.conversationInfo.peer.isChat()) {
      _api.getChat(conversation.conversationInfo.peer.localId).then(
          (Chat chat) {
        result(HistoryHandler(_api, conversation.conversationInfo.peer.id), chat);
      }, onError: error);
    } else {
      result(HistoryHandler(_api, conversation.conversationInfo.peer.id), null);
    }
  }

  void sendMessage(Message message) {
    _api.sendMessage(message.peerId, message.text);
    _setMessageToConversation(message);
  }

  void markAsRead(int peerId) {
    _api.markAsRead(peerId);
  }

  void registerPush(String token) {
    _api.registerPush(token);
  }

  void _init() {
    _conversationHandler = new ConversationHandler(_api);
    _longPollWorker = LongPollWorker(_eventBus);

    _initNewMessageListener();
  }

  void _initNewMessageListener() {
    _eventBus.on<List<Event>>().listen(_loadNewMessages);
  }

  void _loadNewMessages(List<Event> events) {
    if(events.length != 0 && events[0] is NewMessage) {
      List<int> messageIds = List();
      events.forEach((event) {
        NewMessage newMessage = event;
        messageIds.add(newMessage.messageId);
      });
      _api.getMessage(messageIds).then((messages) {
        messages.forEach((message) {
          _setMessageToConversation(message);
          _eventBus.fire(message);
        });
      });
    }
  }

  void _setMessageToConversation(Message message) {
    _conversationHandler.setMessage(message);
  }

  void _startLongPoll() {
    _api.getLongPollServer().then((Map<String, dynamic> map) {
      _longPollWorker.init(map['server'], map['key'], map['ts']);
      _longPollWorker.startPooling();
    });
  }
}
