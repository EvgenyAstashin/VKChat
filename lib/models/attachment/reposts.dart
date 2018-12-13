import 'package:json_annotation/json_annotation.dart';

part 'reposts.g.dart';

@JsonSerializable()
class Reposts {

  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'user_resposted')
  int userResposted;

  Reposts(this.count, this.userResposted);

  factory Reposts.fromJson(Map<String, dynamic> json) => _$RepostsFromJson(json);
}