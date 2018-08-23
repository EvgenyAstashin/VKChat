// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reposts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reposts _$RepostsFromJson(Map<String, dynamic> json) {
  return new Reposts(json['count'] as int, json['user_resposted'] as int);
}

abstract class _$RepostsSerializerMixin {
  int get count;
  int get userResposted;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'count': count, 'user_resposted': userResposted};
}
