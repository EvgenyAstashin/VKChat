import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {

  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'width')
  int width;
  @JsonKey(name: 'height')
  int height;


  Image(this.url, this.width, this.height);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}