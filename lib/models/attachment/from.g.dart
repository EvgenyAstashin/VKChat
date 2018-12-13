// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

From _$FromFromJson(Map<String, dynamic> json) {
  return From(
      json['id'] as int,
      json['name'] as String,
      json['screen_name'] as String,
      json['is_closed'] as int,
      json['type'] as String,
      json['is_admin'] as int,
      json['is_member'] as int,
      json['description'] as String,
      json['photo_50'] as String,
      json['photo_100'] as String,
      json['photo_200'] as String,
      json['first_name'] as String,
      json['last_name'] as String);
}

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screen_name': instance.screenName,
      'is_closed': instance.isClosed,
      'type': instance.type,
      'is_admin': instance.isAdmin,
      'is_member': instance.isMember,
      'description': instance.description,
      'photo_50': instance.photo50,
      'photo_100': instance.photo100,
      'photo_200': instance.photo200,
      'first_name': instance.firstName,
      'last_name': instance.lastName
    };
