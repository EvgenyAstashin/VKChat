import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable()
class Section {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  Section(this.id, this.name);

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);
}