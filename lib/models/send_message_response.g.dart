// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) {
  return new SendMessageResponse(
      json['peer_id'] as int, json['message_id'] as int, json['error'] as int);
}

abstract class _$SendMessageResponseSerializerMixin {
  int get peerId;
  int get messageId;
  int get error;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'peer_id': peerId,
        'message_id': messageId,
        'error': error
      };
}
