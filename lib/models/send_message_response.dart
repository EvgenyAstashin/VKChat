import 'package:json_annotation/json_annotation.dart';

part 'send_message_response.g.dart';

@JsonSerializable()
class SendMessageResponse extends Object with _$SendMessageResponseSerializerMixin {

  @JsonKey(name: 'peer_id')
  int peerId;
  @JsonKey(name: 'message_id')
  int messageId;
  @JsonKey(name: 'error')
  int error;

  SendMessageResponse(this.peerId, this.messageId, this.error);

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) => _$SendMessageResponseFromJson(json);
}
