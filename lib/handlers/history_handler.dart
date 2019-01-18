import 'package:vk_chat/models/message.dart';
import 'package:vk_chat/models/profile.dart';
import 'package:vk_chat/vk/vk_api.dart';

class HistoryHandler {

  int messagesCount;
  List<Message> messages;
  Map<int, Profile> profiles;
  int lastMessageId;
  int peerId;

  VkApi _api;
  bool loading = false;

  HistoryHandler(this._api, int peerId) {
    this.peerId = peerId;
    messages = List();
    profiles = Map();
    lastMessageId = 0;
  }

  void getMessages(void success(), void error()) {
    if(!loading) {
      loading = true;
      _api.getHistory(lastMessageId, peerId).then((Map<String, dynamic> map) {
        _parse(map);
        success();
      }, onError: error).whenComplete((){
        loading = false;
      });
    }
  }

  Profile getProfile(int id) {
    return profiles[id];
  }

  void setMessage(Message message) {
    messagesCount++;
    messages.insert(0, message);
  }

  void _parse(Map<String, dynamic> map) {
    messagesCount = map['count'];
    List<Message> parsedMessages = Message.parseList(map['items']);
    List<Profile> profilesList = Profile.parseList(map['profiles']);
    profilesList.forEach((profile) => profiles[profile.id] = profile);
    if(parsedMessages.length != 0 && lastMessageId != 0)
      parsedMessages.removeAt(0);
    messages.addAll(parsedMessages);
    lastMessageId = messages.last.id;
  }
}