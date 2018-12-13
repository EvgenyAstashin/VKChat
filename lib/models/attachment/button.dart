import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/action.dart';

part 'button.g.dart';

@JsonSerializable()
class Button {

  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'action')
  Action action;

  Button(this.title, this.action);

  factory Button.fromJson(Map<String, dynamic> json) => _$ButtonFromJson(json);
}