// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(json['type'] as String, json['url'] as String);
}

Map<String, dynamic> _$ActionToJson(Action instance) =>
    <String, dynamic>{'type': instance.type, 'url': instance.url};
