import 'package:vk_chat/models/attachment/section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'section')
  Section section;

  Category(this.id, this.name, this.section);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}