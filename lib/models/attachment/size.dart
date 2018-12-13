import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@JsonSerializable()
class Size {

  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'src')
  String src;
  @JsonKey(name: 'width')
  int width;
  @JsonKey(name: 'height')
  int height;

  Size(this.type, this.url, this.width, this.height, this.src);

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);
}