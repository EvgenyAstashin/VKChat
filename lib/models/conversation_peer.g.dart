// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_peer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Peer _$PeerFromJson(Map<String, dynamic> json) {
  return Peer(
      json['id'] as int, json['type'] as String, json['local_id'] as int);
}

Map<String, dynamic> _$PeerToJson(Peer instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'local_id': instance.localId
    };
