import 'package:vk_chat/models/conversation_info.dart';
import 'package:vk_chat/models/message.dart';

class Conversation {

  ConversationInfo conversationInfo;
  Message lastMessage;

  Conversation(this.conversationInfo, this.lastMessage);

  static Conversation parse(Map<String, dynamic> map) {
    return new Conversation(ConversationInfo.parse(map['conversation']),
        Message.parse(map['last_message']));
  }

  static List<Conversation> parseList(List conversations) {
    List<Conversation> parsedConversations = new List();
    conversations.forEach((map) => parsedConversations.add(parse(map)));
    return parsedConversations;
  }
}