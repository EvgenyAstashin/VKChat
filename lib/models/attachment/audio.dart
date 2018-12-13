import 'package:json_annotation/json_annotation.dart';

part 'audio.g.dart';

@JsonSerializable()
class Audio {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'artist')
  String artist;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'genre_id')
  int genreId;
  @JsonKey(name: 'is_hq')
  bool is_hq;

  Audio(this.id, this.ownerId, this.artist, this.title, this.duration,
      this.date, this.url, this.genreId, this.is_hq);

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
}