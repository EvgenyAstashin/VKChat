// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_three_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(json['photo_50'] as String, json['photo_100'] as String,
      json['photo_150'] as String);
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'photo_150': instance.photo_150
    };
