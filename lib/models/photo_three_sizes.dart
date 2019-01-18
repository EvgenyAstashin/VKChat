import 'package:json_annotation/json_annotation.dart';

part 'photo_three_sizes.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'photo_50')
  String photo_50;
  @JsonKey(name: 'photo_100')
  String photo_100;
  @JsonKey(name: 'photo_150')
  String photo_150;

  Photo(this.photo_50, this.photo_100, this.photo_150);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}