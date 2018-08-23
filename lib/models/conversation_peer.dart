import 'package:json_annotation/json_annotation.dart';

part 'conversation_peer.g.dart';

@JsonSerializable()
class Peer extends Object with _$PeerSerializerMixin {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'local_id')
  int localId;

  Peer(this.id, this.type, this.localId);

  factory Peer.fromJson(Map<String, dynamic> json) => _$PeerFromJson(json);

  bool isUser() {
    return type == "user";
  }

  bool isChat() {
    return type == "chat";
  }

  bool isGroup() {
    return type == "group";
  }

  bool isEmail() {
    return type == "email";
  }
}