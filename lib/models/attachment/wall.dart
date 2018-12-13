import 'package:vk_chat/models/attachment/comments.dart';
import 'package:vk_chat/models/attachment/attachment.dart';
import 'package:vk_chat/models/attachment/from.dart';
import 'package:vk_chat/models/attachment/likes.dart';
import 'package:vk_chat/models/attachment/post_source.dart';
import 'package:vk_chat/models/attachment/reposts.dart';
import 'package:vk_chat/models/attachment/views.dart';

import 'package:json_annotation/json_annotation.dart';

part 'wall.g.dart';

@JsonSerializable()
class Wall {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'from_id')
  int fromId;
  @JsonKey(name: 'to_id')
  int toId;
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'post_type')
  String postType;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'marked_as_ads')
  int markedAsAds;
  @JsonKey(name: 'attachments')
  List<Attachment> attachments;
  @JsonKey(name: 'post_source')
  PostSource postSource;
  @JsonKey(name: 'comments')
  Comments comments;
  @JsonKey(name: 'likes')
  Likes likes;
  @JsonKey(name: 'reposts')
  Reposts reposts;
  @JsonKey(name: 'view')
  Views view;
  @JsonKey(name: 'access_key')
  String accessKey;
  @JsonKey(name: 'from')
  From from;


  Wall(this.id, this.fromId, this.toId, this.date, this.postType, this.text,
      this.markedAsAds, this.attachments, this.postSource, this.comments,
      this.likes, this.reposts, this.view, this.accessKey, this.from);

  factory Wall.fromJson(Map<String, dynamic> json) => _$WallFromJson(json);
}