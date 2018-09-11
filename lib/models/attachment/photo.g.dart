// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return new Photo(
      json['id'] as int,
      json['album_id'] as int,
      json['owner_id'] as int,
      json['user_id'] as int,
      (json['sizes'] as List)
          ?.map((e) =>
              e == null ? null : new Size.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['text'] as String,
      json['date'] as int);
}

abstract class _$PhotoSerializerMixin {
  int get id;
  int get albumId;
  int get ownerId;
  int get userId;
  List<Size> get sizes;
  String get text;
  int get date;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'album_id': albumId,
        'owner_id': ownerId,
        'user_id': userId,
        'sizes': sizes,
        'text': text,
        'date': date
      };
}
