// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
      json['url'] as String,
      json['title'] as String,
      json['caption'] as String,
      json['description'] as String,
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['button'] == null
          ? null
          : Button.fromJson(json['button'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'caption': instance.caption,
      'description': instance.description,
      'photo': instance.photo,
      'button': instance.button
    };
