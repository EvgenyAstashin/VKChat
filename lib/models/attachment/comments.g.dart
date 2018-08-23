// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return new Comments(json['count'] as int, json['groups_can_post'] as bool,
      json['can_post'] as int);
}

abstract class _$CommentsSerializerMixin {
  int get count;
  bool get groupsCanPost;
  int get canPost;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'groups_can_post': groupsCanPost,
        'can_post': canPost
      };
}
