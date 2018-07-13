import 'package:vk_chat/models/chat_settings.dart';
import 'package:vk_chat/models/conversation_peer.dart';

class ConversationInfo {

  Peer peer;
  int inRead;
  int outRead;
  int lastMessageId;
  ChatSettings chatSettings;

  ConversationInfo(this.peer, this.inRead, this.outRead, this.lastMessageId, this.chatSettings);
  
  static ConversationInfo parse(Map<String, dynamic> map) {
    return new ConversationInfo(Peer.parse(map['peer']), map['in_read'],
        map['out_read'], map['last_message_id'], ChatSettings.parse(map['chat_settings']));
  }
}