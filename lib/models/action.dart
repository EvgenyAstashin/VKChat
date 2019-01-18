import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/photo_three_sizes.dart';

part 'action.g.dart';

@JsonSerializable()
class Action {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'member_id')
  int memberId;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'photo')
  Photo photo;
  @JsonKey(name: 'message')
  String message;

  Action(this.type, this.memberId, this.text, this.email, this.photo, this.message);

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}