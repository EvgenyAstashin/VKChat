import 'package:json_annotation/json_annotation.dart';

part 'post_source.g.dart';

@JsonSerializable()
class PostSource {

  @JsonKey(name: 'type')
  String type;

  PostSource(this.type);

  factory PostSource.fromJson(Map<String, dynamic> json) => _$PostSourceFromJson(json);
}