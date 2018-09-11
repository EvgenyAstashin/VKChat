// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doc _$DocFromJson(Map<String, dynamic> json) {
  return new Doc(
      json['id'] as int,
      json['owner_id'] as int,
      json['title'] as String,
      json['size'] as int,
      json['ext'] as String,
      json['url'] as String,
      json['date'] as int,
      json['type'] as int,
      json['preview'] == null
          ? null
          : new Preview.fromJson(json['preview'] as Map<String, dynamic>),
      json['access_key'] as String);
}

abstract class _$DocSerializerMixin {
  int get id;
  int get ownerId;
  String get title;
  int get size;
  String get ext;
  String get url;
  int get date;
  int get type;
  Preview get preview;
  String get accessKey;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'owner_id': ownerId,
        'title': title,
        'size': size,
        'ext': ext,
        'url': url,
        'date': date,
        'type': type,
        'preview': preview,
        'access_key': accessKey
      };
}
