// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return new Likes(json['count'] as int, json['user_likes'] as int,
      json['can_like'] as int, json['can_publish'] as int);
}

abstract class _$LikesSerializerMixin {
  int get count;
  int get userLikes;
  int get canLike;
  int get canPublish;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'user_likes': userLikes,
        'can_like': canLike,
        'can_publish': canPublish
      };
}
