// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
      json['count'] as int,
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Message.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'count': instance.messagesCount,
      'items': instance.messages
    };
