// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSettings _$ChatSettingsFromJson(Map<String, dynamic> json) {
  return ChatSettings(
      json['title'] as String,
      json['members_count'] as int,
      json['state'] as String,
      json['photo'] as Map<String, dynamic>,
      json['active_ids'] as List);
}

Map<String, dynamic> _$ChatSettingsToJson(ChatSettings instance) =>
    <String, dynamic>{
      'title': instance.title,
      'members_count': instance.membersCount,
      'state': instance.state,
      'photo': instance.photo,
      'active_ids': instance.activeIds
    };
