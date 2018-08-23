// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationInfo _$ConversationInfoFromJson(Map<String, dynamic> json) {
  return new ConversationInfo(
      json['peer'] == null
          ? null
          : new Peer.fromJson(json['peer'] as Map<String, dynamic>),
      json['in_read'] as int,
      json['out_read'] as int,
      json['last_message_id'] as int,
      json['chat_settings'] == null
          ? null
          : new ChatSettings.fromJson(
              json['chat_settings'] as Map<String, dynamic>));
}

abstract class _$ConversationInfoSerializerMixin {
  Peer get peer;
  int get inRead;
  int get outRead;
  int get lastMessageId;
  ChatSettings get chatSettings;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'peer': peer,
        'in_read': inRead,
        'out_read': outRead,
        'last_message_id': lastMessageId,
        'chat_settings': chatSettings
      };
}
