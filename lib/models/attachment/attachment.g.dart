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
          : new Wall.fromJson(json['wall'] as Map<String, dynamic>));
}

abstract class _$AttachmentSerializerMixin {
  String get type;
  Wall get wall;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': type, 'wall': wall};
}
