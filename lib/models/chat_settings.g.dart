// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSettings _$ChatSettingsFromJson(Map<String, dynamic> json) {
  return new ChatSettings(
      json['title'] as String,
      json['members_count'] as int,
      json['state'] as String,
      json['photo'] as Map<String, dynamic>,
      json['active_ids'] as List);
}

abstract class _$ChatSettingsSerializerMixin {
  String get title;
  int get membersCount;
  String get state;
  Map<String, dynamic> get photo;
  List<dynamic> get activeIds;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'members_count': membersCount,
        'state': state,
        'photo': photo,
        'active_ids': activeIds
      };
}
