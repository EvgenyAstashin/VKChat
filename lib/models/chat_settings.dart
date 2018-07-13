class ChatSettings {

  String title;
  int membersCount;
  String state;
  Map<String, dynamic> photo;
  List<dynamic> activeIds;

  ChatSettings(this.title, this.membersCount, this.state, this.photo,
      this.activeIds);

  static ChatSettings parse(Map<String, dynamic> map) {
    if(map == null)
      return null;
    return new ChatSettings(map['title'], map['members_count'],
        map['state'], map['photo'], map['active_ids']);
  }

  String getPhoto() {
    if(photo != null) {
      if (photo.containsKey('photo_100'))
        return photo['photo_100'];
      if (photo.length != 0)
        return photo[photo.values.elementAt(0)];
    }
    return null;
  }
}