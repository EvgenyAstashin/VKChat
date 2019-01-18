// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
      json['type'] as String,
      json['member_id'] as int,
      json['text'] as String,
      json['email'] as String,
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['message'] as String);
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'type': instance.type,
      'member_id': instance.memberId,
      'text': instance.text,
      'email': instance.email,
      'photo': instance.photo,
      'message': instance.message
    };
