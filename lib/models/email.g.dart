// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) {
  return new Email(json['id'] as int, json['address'] as String);
}

abstract class _$EmailSerializerMixin {
  int get id;
  String get address;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'address': address};
}
