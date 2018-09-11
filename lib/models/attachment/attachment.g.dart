// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return new Attachment(
      json['type'] as String,
      json['wall'] == null
          ? null
          : new Wall.fromJson(json['wall'] as Map<String, dynamic>),
      json['photo'] == null
          ? null
          : new Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['doc'] == null
          ? null
          : new Doc.fromJson(json['doc'] as Map<String, dynamic>),
      json['video'] == null
          ? null
          : new Video.fromJson(json['video'] as Map<String, dynamic>),
      json['link'] == null
          ? null
          : new Link.fromJson(json['link'] as Map<String, dynamic>),
      json['audio'] == null
          ? null
          : new Audio.fromJson(json['audio'] as Map<String, dynamic>),
      json['market'] == null
          ? null
          : new Market.fromJson(json['market'] as Map<String, dynamic>));
}

abstract class _$AttachmentSerializerMixin {
  String get type;
  Wall get wall;
  Photo get photo;
  Doc get doc;
  Video get video;
  Link get link;
  Audio get audio;
  Market get market;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'wall': wall,
        'photo': photo,
        'doc': doc,
        'video': video,
        'link': link,
        'audio': audio,
        'market': market
      };
}
