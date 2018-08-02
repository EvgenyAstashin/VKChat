class Message {

  int date;
  int fromId;
  int id;
  int out;
  int peerId;
  String text;
  int conversationMessageId;
  List<Message> fwdMessages;
  bool important;
  int randomId;
  List<dynamic> attachments;
  bool isHidden;


  Message(this.date, this.fromId, this.id, this.out, this.peerId, this.text,
      this.conversationMessageId, this.fwdMessages, this.important,
      this.randomId, this.attachments, this.isHidden);
  
  static Message parse(Map<String, dynamic> map) {
    return new Message(
        map['date'],
        map['from_id'],
        map['id'],
        map['out'],
        map['peer_id'],
        map['text'],
        map['conversation_message_id'],
        Message.parseList(map['fwd_messages']),
        map['important'],
        map['random_id'],
        map['attachments'],
        map['is_hidden']);
  }

  static List<Message> parseList(List messages) {
    if(messages != null) {
      List<Message> parsedMessages = new List();
      messages.forEach((map) => parsedMessages.add(parse(map)));
      return parsedMessages;
    }
    return List();
  }
}