// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return new Message(
      json['date'] as int,
      json['from_id'] as int,
      json['id'] as int,
      json['out'] as int,
      json['peer_id'] as int,
      json['text'] as String,
      json['conversation_message_id'] as int,
      (json['fwd_messages'] as List)
          ?.map((e) => e == null
              ? null
              : new Message.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['important'] as bool,
      json['random_id'] as int,
      (json['attachments'] as List)
          ?.map((e) => e == null
              ? null
              : new Attachment.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['is_hidden'] as bool);
}

abstract class _$MessageSerializerMixin {
  int get date;
  int get fromId;
  int get id;
  int get out;
  int get peerId;
  String get text;
  int get conversationMessageId;
  List<Message> get fwdMessages;
  bool get important;
  int get randomId;
  List<Attachment> get attachments;
  bool get isHidden;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'from_id': fromId,
        'id': id,
        'out': out,
        'peer_id': peerId,
        'text': text,
        'conversation_message_id': conversationMessageId,
        'fwd_messages': fwdMessages,
        'important': important,
        'random_id': randomId,
        'attachments': attachments,
        'is_hidden': isHidden
      };
}
