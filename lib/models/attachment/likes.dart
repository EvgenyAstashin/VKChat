import 'package:json_annotation/json_annotation.dart';

part 'likes.g.dart';

@JsonSerializable()
class Likes {

  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'user_likes')
  int userLikes;
  @JsonKey(name: 'can_like')
  int canLike;
  @JsonKey(name: 'can_publish')
  int canPublish;

  Likes(this.count, this.userLikes, this.canLike, this.canPublish);

  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);
}