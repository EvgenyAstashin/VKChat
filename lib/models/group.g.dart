// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return new Group(
      json['id'] as int,
      json['name'] as String,
      json['screen_name'] as String,
      json['is_closed'] as int,
      json['type'] as String,
      json['photo_100'] as String);
}

abstract class _$GroupSerializerMixin {
  int get id;
  String get name;
  String get screenName;
  int get isClosed;
  String get type;
  String get photo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'screen_name': screenName,
        'is_closed': isClosed,
        'type': type,
        'photo_100': photo
      };
}
