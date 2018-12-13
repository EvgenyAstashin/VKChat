import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'comments')
  int comments;
  @JsonKey(name: 'views')
  int views;
  @JsonKey(name: 'width')
  int width;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'photo_130')
  String photo130;
  @JsonKey(name: 'photo_320')
  String photo320;
  @JsonKey(name: 'photo_800')
  String photo800;
  @JsonKey(name: 'access_key')
  String accessKey;
  @JsonKey(name: 'can_add')
  int canAdd;

  Video(this.id, this.ownerId, this.title, this.duration, this.description,
      this.date, this.comments, this.views, this.width, this.height,
      this.photo130, this.photo320, this.photo800, this.accessKey, this.canAdd);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}

