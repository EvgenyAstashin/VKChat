// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wall _$WallFromJson(Map<String, dynamic> json) {
  return Wall(
      json['id'] as int,
      json['from_id'] as int,
      json['to_id'] as int,
      json['date'] as int,
      json['post_type'] as String,
      json['text'] as String,
      json['marked_as_ads'] as int,
      (json['attachments'] as List)
          ?.map((e) =>
              e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['post_source'] == null
          ? null
          : PostSource.fromJson(json['post_source'] as Map<String, dynamic>),
      json['comments'] == null
          ? null
          : Comments.fromJson(json['comments'] as Map<String, dynamic>),
      json['likes'] == null
          ? null
          : Likes.fromJson(json['likes'] as Map<String, dynamic>),
      json['reposts'] == null
          ? null
          : Reposts.fromJson(json['reposts'] as Map<String, dynamic>),
      json['view'] == null
          ? null
          : Views.fromJson(json['view'] as Map<String, dynamic>),
      json['access_key'] as String,
      json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WallToJson(Wall instance) => <String, dynamic>{
      'id': instance.id,
      'from_id': instance.fromId,
      'to_id': instance.toId,
      'date': instance.date,
      'post_type': instance.postType,
      'text': instance.text,
      'marked_as_ads': instance.markedAsAds,
      'attachments': instance.attachments,
      'post_source': instance.postSource,
      'comments': instance.comments,
      'likes': instance.likes,
      'reposts': instance.reposts,
      'view': instance.view,
      'access_key': instance.accessKey,
      'from': instance.from
    };
