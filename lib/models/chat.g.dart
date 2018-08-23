// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return new Chat(
      json['type'] as String,
      json['title'] as String,
      json['admin_id'] as int,
      json['members_count'] as int,
      (json['users'] as List)
          ?.map((e) => e == null
              ? null
              : new Profile.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$ChatSerializerMixin {
  String get type;
  String get title;
  int get adminId;
  int get membersCount;
  List<Profile> get users;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'title': title,
        'admin_id': adminId,
        'members_count': membersCount,
        'users': users
      };
}
