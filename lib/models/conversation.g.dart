// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return new Conversation(
      json['conversation'] == null
          ? null
          : new ConversationInfo.fromJson(
              json['conversation'] as Map<String, dynamic>),
      json['last_message'] == null
          ? null
          : new Message.fromJson(json['last_message'] as Map<String, dynamic>));
}

abstract class _$ConversationSerializerMixin {
  ConversationInfo get conversationInfo;
  Message get lastMessage;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'conversation': conversationInfo,
        'last_message': lastMessage
      };
}
