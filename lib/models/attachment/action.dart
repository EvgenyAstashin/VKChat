import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class Action extends Object with _$ActionSerializerMixin {

  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'url')
  String url;

  Action(this.type, this.url);

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}