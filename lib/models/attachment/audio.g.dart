// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(
      json['id'] as int,
      json['owner_id'] as int,
      json['artist'] as String,
      json['title'] as String,
      json['duration'] as int,
      json['date'] as int,
      json['url'] as String,
      json['genre_id'] as int,
      json['is_hq'] as bool);
}

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'artist': instance.artist,
      'title': instance.title,
      'duration': instance.duration,
      'date': instance.date,
      'url': instance.url,
      'genre_id': instance.genreId,
      'is_hq': instance.is_hq
    };
