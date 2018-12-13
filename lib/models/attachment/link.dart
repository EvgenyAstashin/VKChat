import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/button.dart';
import 'package:vk_chat/models/attachment/photo.dart';

part 'link.g.dart';

@JsonSerializable()
class Link {

  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'caption')
  String caption;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'photo')
  Photo photo;
  @JsonKey(name: 'button')
  Button button;

  Link(this.url, this.title, this.caption, this.description, this.photo,
      this.button);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}