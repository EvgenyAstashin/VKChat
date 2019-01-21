import 'package:vk_chat/models/conversation_info.dart';
import 'package:vk_chat/models/message.dart';

import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {

  @JsonKey(name: 'conversation')
  ConversationInfo conversationInfo;
  @JsonKey(name: 'last_message')
  Message lastMessage;

  Conversation(this.conversationInfo, this.lastMessage);

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

  static List<Conversation> parseList(List conversations) {
    List<Conversation> parsedConversations = new List();
    conversations.forEach((map) => parsedConversations.add(Conversation.fromJson(map)));
    return parsedConversations;
  }

  int getId(){
    return conversationInfo.peer.id;
  }

  int getLocalId() {
    return conversationInfo.peer.localId;
  }
}