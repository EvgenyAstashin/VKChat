// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preview _$PreviewFromJson(Map<String, dynamic> json) {
  return new Preview(json['photo'] == null
      ? null
      : new Photo.fromJson(json['photo'] as Map<String, dynamic>));
}

abstract class _$PreviewSerializerMixin {
  Photo get photo;
  Map<String, dynamic> toJson() => <String, dynamic>{'photo': photo};
}
