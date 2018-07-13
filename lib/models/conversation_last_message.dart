class ConversationLastMessage {

  int date;
  int fromId;
  int id;
  int out;
  int peerId;
  String text;
  int conversationMessageId;

  ConversationLastMessage(this.date, this.fromId, this.id, this.out,
      this.peerId, this.text, this.conversationMessageId);
  
  static ConversationLastMessage parse(Map<String, dynamic> map) {
    return new ConversationLastMessage(map['date'], map['from_id'], map['id'],
        map['out'], map['peer_id'], map['text'], map['conversation_message_id']);
  }
}