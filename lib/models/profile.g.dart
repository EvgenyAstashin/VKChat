// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return new Profile(json['id'] as int, json['first_name'] as String,
      json['last_name'] as String, json['photo_100'] as String);
}

abstract class _$ProfileSerializerMixin {
  int get id;
  String get firstName;
  String get lastName;
  String get avatar;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'photo_100': avatar
      };
}
