import 'package:vk_chat/models/message.dart';

class History {
  int messagesCount;

  History(this.messagesCount, this.messages);

  List<Message> messages;

  static History parse(Map<String, dynamic> map) {
    History user = new History(
        map['count'],
        Message.parseList(map['items'])
    );
    return user;
  }
}