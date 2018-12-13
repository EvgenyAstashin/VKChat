// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      json['id'] as int,
      json['name'] as String,
      json['section'] == null
          ? null
          : Section.fromJson(json['section'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'section': instance.section
    };
