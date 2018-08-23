// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_peer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Peer _$PeerFromJson(Map<String, dynamic> json) {
  return new Peer(
      json['id'] as int, json['type'] as String, json['local_id'] as int);
}

abstract class _$PeerSerializerMixin {
  int get id;
  String get type;
  int get localId;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'type': type, 'local_id': localId};
}
