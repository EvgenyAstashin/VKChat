// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doc _$DocFromJson(Map<String, dynamic> json) {
  return Doc(
      json['id'] as int,
      json['owner_id'] as int,
      json['title'] as String,
      json['size'] as int,
      json['ext'] as String,
      json['url'] as String,
      json['date'] as int,
      json['type'] as int,
      json['preview'] == null
          ? null
          : Preview.fromJson(json['preview'] as Map<String, dynamic>),
      json['access_key'] as String);
}

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'size': instance.size,
      'ext': instance.ext,
      'url': instance.url,
      'date': instance.date,
      'type': instance.type,
      'preview': instance.preview,
      'access_key': instance.accessKey
    };
