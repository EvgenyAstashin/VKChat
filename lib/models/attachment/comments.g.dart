// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return Comments(json['count'] as int, json['groups_can_post'] as bool,
      json['can_post'] as int);
}

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'count': instance.count,
      'groups_can_post': instance.groupsCanPost,
      'can_post': instance.canPost
    };
