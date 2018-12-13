// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(
      json['type'] as String,
      json['wall'] == null
          ? null
          : Wall.fromJson(json['wall'] as Map<String, dynamic>),
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['doc'] == null
          ? null
          : Doc.fromJson(json['doc'] as Map<String, dynamic>),
      json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
      json['link'] == null
          ? null
          : Link.fromJson(json['link'] as Map<String, dynamic>),
      json['audio'] == null
          ? null
          : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      json['market'] == null
          ? null
          : Market.fromJson(json['market'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'type': instance.type,
      'wall': instance.wall,
      'photo': instance.photo,
      'doc': instance.doc,
      'video': instance.video,
      'link': instance.link,
      'audio': instance.audio,
      'market': instance.market
    };
