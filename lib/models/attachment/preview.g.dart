// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preview _$PreviewFromJson(Map<String, dynamic> json) {
  return Preview(json['photo'] == null
      ? null
      : Photo.fromJson(json['photo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PreviewToJson(Preview instance) =>
    <String, dynamic>{'photo': instance.photo};
