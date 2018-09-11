// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return new Audio(
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

abstract class _$AudioSerializerMixin {
  int get id;
  int get ownerId;
  String get artist;
  String get title;
  int get duration;
  int get date;
  String get url;
  int get genreId;
  bool get is_hq;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'owner_id': ownerId,
        'artist': artist,
        'title': title,
        'duration': duration,
        'date': date,
        'url': url,
        'genre_id': genreId,
        'is_hq': is_hq
      };
}
