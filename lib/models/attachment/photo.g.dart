// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
      json['id'] as int,
      json['album_id'] as int,
      json['owner_id'] as int,
      json['user_id'] as int,
      (json['sizes'] as List)
          ?.map((e) =>
              e == null ? null : Size.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['text'] as String,
      json['date'] as int);
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'album_id': instance.albumId,
      'owner_id': instance.ownerId,
      'user_id': instance.userId,
      'sizes': instance.sizes,
      'text': instance.text,
      'date': instance.date
    };
