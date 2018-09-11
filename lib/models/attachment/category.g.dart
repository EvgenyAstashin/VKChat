// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return new Category(
      json['id'] as int,
      json['name'] as String,
      json['section'] == null
          ? null
          : new Section.fromJson(json['section'] as Map<String, dynamic>));
}

abstract class _$CategorySerializerMixin {
  int get id;
  String get name;
  Section get section;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'section': section};
}
