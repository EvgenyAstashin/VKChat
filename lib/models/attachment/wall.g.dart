// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wall _$WallFromJson(Map<String, dynamic> json) {
  return new Wall(
      json['id'] as int,
      json['from_id'] as int,
      json['to_id'] as int,
      json['date'] as int,
      json['post_type'] as String,
      json['text'] as String,
      json['marked_as_ads'] as int,
      (json['attachments'] as List)
          ?.map((e) => e == null
              ? null
              : new Attachment.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['post_source'] == null
          ? null
          : new PostSource.fromJson(
              json['post_source'] as Map<String, dynamic>),
      json['comments'] == null
          ? null
          : new Comments.fromJson(json['comments'] as Map<String, dynamic>),
      json['likes'] == null
          ? null
          : new Likes.fromJson(json['likes'] as Map<String, dynamic>),
      json['reposts'] == null
          ? null
          : new Reposts.fromJson(json['reposts'] as Map<String, dynamic>),
      json['view'] == null
          ? null
          : new Views.fromJson(json['view'] as Map<String, dynamic>),
      json['access_key'] as String,
      json['from'] == null
          ? null
          : new From.fromJson(json['from'] as Map<String, dynamic>));
}

abstract class _$WallSerializerMixin {
  int get id;
  int get fromId;
  int get toId;
  int get date;
  String get postType;
  String get text;
  int get markedAsAds;
  List<Attachment> get attachments;
  PostSource get postSource;
  Comments get comments;
  Likes get likes;
  Reposts get reposts;
  Views get view;
  String get accessKey;
  From get from;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'from_id': fromId,
        'to_id': toId,
        'date': date,
        'post_type': postType,
        'text': text,
        'marked_as_ads': markedAsAds,
        'attachments': attachments,
        'post_source': postSource,
        'comments': comments,
        'likes': likes,
        'reposts': reposts,
        'view': view,
        'access_key': accessKey,
        'from': from
      };
}
