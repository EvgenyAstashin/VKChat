// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Button _$ButtonFromJson(Map<String, dynamic> json) {
  return Button(
      json['title'] as String,
      json['action'] == null
          ? null
          : Action.fromJson(json['action'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ButtonToJson(Button instance) =>
    <String, dynamic>{'title': instance.title, 'action': instance.action};
