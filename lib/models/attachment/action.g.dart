// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return new Action(json['type'] as String, json['url'] as String);
}

abstract class _$ActionSerializerMixin {
  String get type;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{'type': type, 'url': url};
}
