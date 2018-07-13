class Peer {

  int id;
  String type;
  int localId;


  Peer(this.id, this.type, this.localId);

  static Peer parse(Map<String, dynamic> map) {
    return new Peer(map['id'], map['type'], map['local_id']);
  }

  bool isUser() {
    return type == "user";
  }

  bool isChat() {
    return type == "chat";
  }

  bool isGroup() {
    return type == "group";
  }

  bool isEmail() {
    return type == "email";
  }
}