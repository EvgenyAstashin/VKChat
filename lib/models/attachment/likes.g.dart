// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return Likes(json['count'] as int, json['user_likes'] as int,
      json['can_like'] as int, json['can_publish'] as int);
}

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'count': instance.count,
      'user_likes': instance.userLikes,
      'can_like': instance.canLike,
      'can_publish': instance.canPublish
    };
