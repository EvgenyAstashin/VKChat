import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/photo.dart';

part 'preview.g.dart';

@JsonSerializable()
class Preview {

  @JsonKey(name: 'photo')
  Photo photo;

  Preview(this.photo);

  factory Preview.fromJson(Map<String, dynamic> json) => _$PreviewFromJson(json);
}