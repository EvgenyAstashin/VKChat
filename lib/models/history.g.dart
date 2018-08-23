// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) {
  return new History(
      json['count'] as int,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : new Message.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$HistorySerializerMixin {
  int get messagesCount;
  List<Message> get messages;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'count': messagesCount, 'items': messages};
}
