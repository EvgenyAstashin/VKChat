import 'package:json_annotation/json_annotation.dart';

part 'views.g.dart';

@JsonSerializable()
class Views extends Object with _$ViewsSerializerMixin  {

  @JsonKey(name: 'count')
  int count;

  Views(this.count);

  factory Views.fromJson(Map<String, dynamic> json) => _$ViewsFromJson(json);
}