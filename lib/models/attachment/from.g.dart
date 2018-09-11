// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

From _$FromFromJson(Map<String, dynamic> json) {
  return new From(
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
      json['photo_200'] as String);
}

abstract class _$FromSerializerMixin {
  int get id;
  String get name;
  String get screenName;
  int get isClosed;
  String get type;
  int get isAdmin;
  int get isMember;
  String get description;
  String get photo50;
  String get photo100;
  String get photo200;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'screen_name': screenName,
        'is_closed': isClosed,
        'type': type,
        'is_admin': isAdmin,
        'is_member': isMember,
        'description': description,
        'photo_50': photo50,
        'photo_100': photo100,
        'photo_200': photo200
      };
}
