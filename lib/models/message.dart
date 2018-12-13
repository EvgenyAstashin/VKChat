import 'package:vk_chat/models/attachment/attachment.dart';

import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {

  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'from_id')
  int fromId;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'out')
  int out;
  @JsonKey(name: 'peer_id')
  int peerId;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'conversation_message_id')
  int conversationMessageId;
  @JsonKey(name: 'fwd_messages')
  List<Message> fwdMessages;
  @JsonKey(name: 'important')
  bool important;
  @JsonKey(name: 'random_id')
  int randomId;
  @JsonKey(name: 'attachments')
  List<Attachment> attachments;
  @JsonKey(name: 'is_hidden')
  bool isHidden;

  Message(this.date, this.fromId, this.id, this.out, this.peerId, this.text,
      this.conversationMessageId, this.fwdMessages, this.important,
      this.randomId, this.attachments, this.isHidden);

  Message.createMessage(int date, int fromId, int peerId, String text) {
    this.date = date;
    this.fromId = fromId;
    this.peerId = peerId;
    this.text = text;
  }

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  static List<Message> parseList(List messages) {
    if(messages != null) {
      List<Message> parsedMessages = new List();
      messages.forEach((map) => parsedMessages.add(Message.fromJson(map)));
      return parsedMessages;
    }
    return List();
  }
}