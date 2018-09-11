import 'package:vk_chat/models/attachment/audio.dart';
import 'package:vk_chat/models/attachment/doc.dart';
import 'package:vk_chat/models/attachment/link.dart';
import 'package:vk_chat/models/attachment/market.dart';
import 'package:vk_chat/models/attachment/photo.dart';
import 'package:vk_chat/models/attachment/video.dart';
import 'package:vk_chat/models/attachment/wall.dart';

import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment extends Object with _$AttachmentSerializerMixin {

  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'wall')
  Wall wall;
  @JsonKey(name: 'photo')
  Photo photo;
  @JsonKey(name: 'doc')
  Doc doc;
  @JsonKey(name: 'video')
  Video video;
  @JsonKey(name: 'link')
  Link link;
  @JsonKey(name: 'audio')
  Audio audio;
  @JsonKey(name: 'market')
  Market market;
  
  Attachment(this.type, this.wall, this.photo, this.doc, this.video, this.link, this.audio, this.market);

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
}