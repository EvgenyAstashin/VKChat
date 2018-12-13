// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reposts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reposts _$RepostsFromJson(Map<String, dynamic> json) {
  return Reposts(json['count'] as int, json['user_resposted'] as int);
}

Map<String, dynamic> _$RepostsToJson(Reposts instance) => <String, dynamic>{
      'count': instance.count,
      'user_resposted': instance.userResposted
    };
