import 'package:vk_chat/models/profile.dart';

class Chat {
  String type;
  String title;
  int adminId;
  int membersCount;
  Map<int, Profile> users;

  Chat(this.type, this.title, this.adminId, this.membersCount, List<Profile> users) {
    this.users = Map();
    users.forEach((Profile profile) => this.users[profile.id] = profile);
  }


  static Chat parse(Map<String, dynamic> map) {
    Chat chat = new Chat(
        map['type'],
        map['title'],
        map['admin_id'],
        map['members_count'],
        Profile.parseList(map['users'])
    );
    return chat;
  }
}