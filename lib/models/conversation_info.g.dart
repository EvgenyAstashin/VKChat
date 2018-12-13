// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationInfo _$ConversationInfoFromJson(Map<String, dynamic> json) {
  return ConversationInfo(
      json['peer'] == null
          ? null
          : Peer.fromJson(json['peer'] as Map<String, dynamic>),
      json['in_read'] as int,
      json['out_read'] as int,
      json['last_message_id'] as int,
      json['chat_settings'] == null
          ? null
          : ChatSettings.fromJson(
              json['chat_settings'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ConversationInfoToJson(ConversationInfo instance) =>
    <String, dynamic>{
      'peer': instance.peer,
      'in_read': instance.inRead,
      'out_read': instance.outRead,
      'last_message_id': instance.lastMessageId,
      'chat_settings': instance.chatSettings
    };
