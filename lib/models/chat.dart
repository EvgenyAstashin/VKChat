import 'package:vk_chat/models/profile.dart';

import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat extends Object with _$ChatSerializerMixin {

  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'admin_id')
  int adminId;
  @JsonKey(name: 'members_count')
  int membersCount;
  @JsonKey(name: 'users')
  List<Profile> users;

  @JsonKey(ignore: true)
  Map<int, Profile> usersMap;

  Chat(this.type, this.title, this.adminId, this.membersCount, List<Profile> users) {
    this.usersMap = Map();
    users.forEach((Profile profile) => this.users[profile.id] = profile);
  }

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}