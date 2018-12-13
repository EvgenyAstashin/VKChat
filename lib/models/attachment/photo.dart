import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/size.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'album_id')
  int albumId;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'sizes')
  List<Size> sizes;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'date')
  int date;

  Photo(this.id, this.albumId, this.ownerId, this.userId, this.sizes, this.text,
      this.date);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}