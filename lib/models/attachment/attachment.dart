import 'package:vk_chat/models/attachment/wall.dart';

import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment extends Object with _$AttachmentSerializerMixin {

  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'wall')
  Wall wall;

  Attachment(this.type, this.wall);

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
}