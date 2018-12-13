// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      json['date'] as int,
      json['from_id'] as int,
      json['id'] as int,
      json['out'] as int,
      json['peer_id'] as int,
      json['text'] as String,
      json['conversation_message_id'] as int,
      (json['fwd_messages'] as List)
          ?.map((e) =>
              e == null ? null : Message.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['important'] as bool,
      json['random_id'] as int,
      (json['attachments'] as List)
          ?.map((e) =>
              e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['is_hidden'] as bool);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'date': instance.date,
      'from_id': instance.fromId,
      'id': instance.id,
      'out': instance.out,
      'peer_id': instance.peerId,
      'text': instance.text,
      'conversation_message_id': instance.conversationMessageId,
      'fwd_messages': instance.fwdMessages,
      'important': instance.important,
      'random_id': instance.randomId,
      'attachments': instance.attachments,
      'is_hidden': instance.isHidden
    };
