import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/email.dart';
import 'package:vk_chat/models/group.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/vk/vk.dart';

class ConversationHandler {

  int count;
  List<Conversation> conversations;
  Map<int, Profile> profiles;
  Map<int, Group> groups;
  Map<int, Email> emails;

  VK vk;

  ConversationHandler() {
    vk = VK.getInstance();
    conversations = new List();
    profiles = new Map();
    groups = new Map();
    emails = new Map();
  }

  void getConversations(void success(), void error()) {
    vk.getConversations(conversations.length).then((Map<String, dynamic> map) {_parse(map); success();}, onError: error);
  }

  void _parse(Map<String, dynamic> map) {
    count = map['count'];
    conversations.addAll(Conversation.parseList(map['items']));
    _addProfiles(map['profiles']);
    _addGroups(map['groups']);
    _addEmails(map['emails']);
  }
  
  void _addProfiles(List profiles) {
     Profile.parseList(profiles).forEach((Profile profile) =>
     this.profiles[profile.id] = profile);
  }
  
  void _addGroups(List groups) {
    Group.parseList(groups).forEach((Group group) =>
    this.groups[group.id] = group);
  }

  void _addEmails(List emails) {
    Email.parseList(emails).forEach((Email email) =>
    this.emails[email.id] = email);
  }
}