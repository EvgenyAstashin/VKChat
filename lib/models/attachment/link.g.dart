// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) {
  return new Link(
      json['url'] as String,
      json['title'] as String,
      json['caption'] as String,
      json['description'] as String,
      json['photo'] == null
          ? null
          : new Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['button'] == null
          ? null
          : new Button.fromJson(json['button'] as Map<String, dynamic>));
}

abstract class _$LinkSerializerMixin {
  String get url;
  String get title;
  String get caption;
  String get description;
  Photo get photo;
  Button get button;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'title': title,
        'caption': caption,
        'description': description,
        'photo': photo,
        'button': button
      };
}
