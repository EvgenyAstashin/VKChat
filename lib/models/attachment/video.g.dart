// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) {
  return new Video(
      json['id'] as int,
      json['owner_id'] as int,
      json['title'] as String,
      json['duration'] as int,
      json['description'] as String,
      json['date'] as int,
      json['comments'] as int,
      json['views'] as int,
      json['width'] as int,
      json['height'] as int,
      json['photo_130'] as String,
      json['photo_320'] as String,
      json['photo_800'] as String,
      json['access_key'] as String,
      json['can_add'] as int);
}

abstract class _$VideoSerializerMixin {
  int get id;
  int get ownerId;
  String get title;
  int get duration;
  String get description;
  int get date;
  int get comments;
  int get views;
  int get width;
  int get height;
  String get photo130;
  String get photo320;
  String get photo800;
  String get accessKey;
  int get canAdd;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'owner_id': ownerId,
        'title': title,
        'duration': duration,
        'description': description,
        'date': date,
        'comments': comments,
        'views': views,
        'width': width,
        'height': height,
        'photo_130': photo130,
        'photo_320': photo320,
        'photo_800': photo800,
        'access_key': accessKey,
        'can_add': canAdd
      };
}
