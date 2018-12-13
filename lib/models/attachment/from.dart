import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/preview.dart';

part 'from.g.dart';

@JsonSerializable()
class From {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'screen_name')
  String screenName;
  @JsonKey(name: 'is_closed')
  int isClosed;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'is_admin')
  int isAdmin;
  @JsonKey(name: 'is_member')
  int isMember;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'photo_50')
  String photo50;
  @JsonKey(name: 'photo_100')
  String photo100;
  @JsonKey(name: 'photo_200')
  String photo200;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;

  From(this.id, this.name, this.screenName, this.isClosed, this.type,
      this.isAdmin, this.isMember, this.description, this.photo50,
      this.photo100, this.photo200, this.firstName, this.lastName);

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  bool isFromProfile() {
    return type == 'profile';
  }
}