// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
      json['id'] as int,
      json['name'] as String,
      json['screen_name'] as String,
      json['is_closed'] as int,
      json['type'] as String,
      json['photo_100'] as String);
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screen_name': instance.screenName,
      'is_closed': instance.isClosed,
      'type': instance.type,
      'photo_100': instance.photo
    };
