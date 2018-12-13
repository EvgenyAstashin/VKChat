import 'package:vk_chat/models/chat_settings.dart';
import 'package:vk_chat/models/conversation_peer.dart';

import 'package:json_annotation/json_annotation.dart';

part 'conversation_info.g.dart';

@JsonSerializable()
class ConversationInfo {

  @JsonKey(name: 'peer')
  Peer peer;
  @JsonKey(name: 'in_read')
  int inRead;
  @JsonKey(name: 'out_read')
  int outRead;
  @JsonKey(name: 'last_message_id')
  int lastMessageId;
  @JsonKey(name: 'chat_settings')
  ChatSettings chatSettings;

  ConversationInfo(this.peer, this.inRead, this.outRead, this.lastMessageId, this.chatSettings);

  factory ConversationInfo.fromJson(Map<String, dynamic> json) => _$ConversationInfoFromJson(json);
}