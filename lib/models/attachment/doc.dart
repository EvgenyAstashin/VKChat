import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/preview.dart';

part 'doc.g.dart';

@JsonSerializable()
class Doc {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'size')
  int size;
  @JsonKey(name: 'ext')
  String ext;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'preview')
  Preview preview;
  @JsonKey(name: 'access_key')
  String accessKey;

  Doc(this.id, this.ownerId, this.title, this.size, this.ext, this.url,
      this.date, this.type, this.preview, this.accessKey);

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
}

