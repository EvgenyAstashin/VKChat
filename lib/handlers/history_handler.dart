import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/vk/vk.dart';

class HistoryHandler {

  int messagesCount;
  List<Message> messages;
  int lastMessageId;
  int peerId;

  VK vk;
  bool loading = false;

  HistoryHandler(int peerId) {
    this.peerId = peerId;
    messages = List();
    lastMessageId = 0;
    vk = VK.getInstance();
  }

  void getMessages(void success(), void error()) {
    if(!loading) {
      loading = true;
      vk.getHistory(lastMessageId, peerId).then((Map<String, dynamic> map) {
        _parse(map);
        success();
      }, onError: error).whenComplete((){
        loading = false;
      });
    }
  }

  void sendMessage(Message message) {
    messagesCount++;
    messages.insert(0, message);
  }

  void _parse(Map<String, dynamic> map) {
    messagesCount = map['count'];
    List<Message> parsedMessages = Message.parseList(map['items']);
    if(parsedMessages.length != 0 && lastMessageId != 0)
      parsedMessages.removeAt(0);
    messages.addAll(parsedMessages);
    lastMessageId = messages.last.id;
  }
}