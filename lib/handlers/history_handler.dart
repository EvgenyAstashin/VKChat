import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/vk/vk.dart';

class HistoryHandler {

  int messagesCount;
  List<Message> messages;
  int lastMessageId;
  int peerId;

  VK vk;

  HistoryHandler(int peerId) {
    this.peerId = peerId;
    messages = List();
    lastMessageId = 0;
    vk = VK.getInstance();
  }

  void getMessages(void success(), void error()) {
    vk.getHistory(lastMessageId, peerId).then((Map<String, dynamic> map) {_parse(map); success();}, onError: error);
  }

  void _parse(Map<String, dynamic> map) {
    messagesCount = map['count'];
    messages.addAll(Message.parseList(map['items']));
    lastMessageId = messages[messages.length - 1].id;
  }
}