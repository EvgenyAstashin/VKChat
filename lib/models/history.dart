import 'package:vk_chat/models/message.dart';

import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History {

  @JsonKey(name: 'count')
  int messagesCount;
  @JsonKey(name: 'items')
  List<Message> messages;

  History(this.messagesCount, this.messages);

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);
}