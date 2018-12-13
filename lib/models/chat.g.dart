// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
      json['type'] as String,
      json['title'] as String,
      json['admin_id'] as int,
      json['members_count'] as int,
      (json['users'] as List)
          ?.map((e) =>
              e == null ? null : Profile.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'admin_id': instance.adminId,
      'members_count': instance.membersCount,
      'users': instance.users
    };
