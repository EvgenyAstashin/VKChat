// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Button _$ButtonFromJson(Map<String, dynamic> json) {
  return new Button(
      json['title'] as String,
      json['action'] == null
          ? null
          : new Action.fromJson(json['action'] as Map<String, dynamic>));
}

abstract class _$ButtonSerializerMixin {
  String get title;
  Action get action;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'action': action};
}
