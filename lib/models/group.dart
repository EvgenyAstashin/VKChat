import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Object with _$GroupSerializerMixin {

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
  @JsonKey(name: 'photo_100')
  String photo;

  Group(this.id,
      this.name,
      this.screenName,
      this.isClosed,
      this.type,
      this.photo);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  static List<Group> parseList(List users) {
    List<Group> parsedUsers = new List();
    if(users != null)
      users.forEach((map) => parsedUsers.add(Group.fromJson(map)));
    return parsedUsers;
  }
}