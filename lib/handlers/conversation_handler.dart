import 'package:vk_chat/models/conversation.dart';
import 'package:vk_chat/models/email.dart';
import 'package:vk_chat/models/group.dart';
import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/vk/vk_api.dart';
import 'package:flutter/material.dart';

class ConversationHandler {

  int count;
  Map<int, Conversation> _conversationsMap;
  List<Conversation> _conversationsList;
  Map<int, Profile> profiles;
  Map<int, Group> groups;
  Map<int, Email> emails;
  VkApi _api;
  bool _clear = true;

  ConversationHandler(this._api) {
    _conversationsMap = new Map();
    _conversationsList = List();
    profiles = new Map();
    groups = new Map();
    emails = new Map();
  }

  void getConversations(void success(), void error()) {
    _clear = false;
    _api.getConversations(_conversationsMap.length).then((Map<String, dynamic> map) {_parse(map); success();}, onError: error);
  }

  List<Conversation> getConversationsList() {
    return _conversationsList;
  }

  void setMessage(Message message) {
    if(_conversationsMap.containsKey(message.peerId)) {
      Conversation conversation = _conversationsMap[message.peerId];
      conversation.lastMessage = message;
      _conversationsList.remove(conversation);
      _conversationsList.insert(0, conversation);
    }
  }

  void clear() {
    _conversationsMap.clear();
    _conversationsList.clear();
    profiles.clear();
    groups.clear();
    emails.clear();
    _clear = true;
  }

  bool isEmpty() {
    return _conversationsList.isEmpty;
  }

  String getConversationTitle(int conversationId) {
    Conversation conversation = _conversationsMap[conversationId];
    if (conversation.conversationInfo.peer.isUser())
      return _getUserConversationTitle(conversation);
    else if (conversation.conversationInfo.peer.isChat())
      return _getChatConversationTitle(conversation);
    else if (conversation.conversationInfo.peer.isGroup())
      return _getGroupConversationTitle(conversation);
    else if (conversation.conversationInfo.peer.isEmail())
      return _getEmailConversationTitle(conversation);
    return "";
  }

  ImageProvider getConversationAvatarProvider(int conversationId) {
    Conversation conversation = _conversationsMap[conversationId];
    if (conversation.conversationInfo.peer.isUser())
      return _getUserAvatarProvider(conversation);
    else if (conversation.conversationInfo.peer.isChat())
      return _getChatAvatarProvider(conversation);
    else if (conversation.conversationInfo.peer.isGroup())
      return _getGroupAvatarProvider(conversation);
    return new NetworkImage('');
  }

  String _getUserConversationTitle(Conversation conversation) {
    Profile profile = profiles[conversation.getLocalId()];
    return "${profile.firstName} ${profile.lastName}";
  }

  String _getChatConversationTitle(Conversation conversation) {
    return conversation.conversationInfo.chatSettings.title;
  }

  String _getGroupConversationTitle(Conversation conversation) {
    Group group = groups[conversation.getLocalId()];
    return group.name;
  }

  String _getEmailConversationTitle(Conversation conversation) {
    Email email = emails[conversation.getLocalId()];
    return email.address;
  }

  ImageProvider _getUserAvatarProvider(Conversation conversation) {
    Profile profile = profiles[conversation.getLocalId()];
    return new NetworkImage(profile.avatar);
  }

  ImageProvider _getChatAvatarProvider(Conversation conversation) {
    String photo = conversation.conversationInfo.chatSettings.getPhoto();
    if (photo != null)
      return new NetworkImage(photo);
    else
      return new AssetImage('assets/chat.png');
  }

  ImageProvider _getGroupAvatarProvider(Conversation conversation) {
    Group group = groups[conversation.getLocalId()];
    return new NetworkImage(group.photo);
  }

  void _parse(Map<String, dynamic> map) {
    if(!_clear) {
      count = map['count'];
      Conversation.parseList(map['items']).forEach((conversation) {
        _conversationsMap[conversation.getId()] = conversation;
        _conversationsList.add(conversation);
      });
      if (map['profiles'] != null)
        _addProfiles(map['profiles']);
      if (map['groups'] != null)
        _addGroups(map['groups']);
      if (map['emails'] != null)
        _addEmails(map['emails']);
    }
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