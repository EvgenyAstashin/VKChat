import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@JsonSerializable()
class Comments extends Object with _$CommentsSerializerMixin  {

  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'groups_can_post')
  bool groupsCanPost;
  @JsonKey(name: 'can_post')
  int canPost;

  Comments(this.count, this.groupsCanPost, this.canPost);

  factory Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);
}