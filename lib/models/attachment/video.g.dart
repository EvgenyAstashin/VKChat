// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
      json['id'] as int,
      json['owner_id'] as int,
      json['title'] as String,
      json['duration'] as int,
      json['description'] as String,
      json['date'] as int,
      json['comments'] as int,
      json['views'] as int,
      json['width'] as int,
      json['height'] as int,
      json['photo_130'] as String,
      json['photo_320'] as String,
      json['photo_800'] as String,
      json['access_key'] as String,
      json['can_add'] as int);
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'duration': instance.duration,
      'description': instance.description,
      'date': instance.date,
      'comments': instance.comments,
      'views': instance.views,
      'width': instance.width,
      'height': instance.height,
      'photo_130': instance.photo130,
      'photo_320': instance.photo320,
      'photo_800': instance.photo800,
      'access_key': instance.accessKey,
      'can_add': instance.canAdd
    };
