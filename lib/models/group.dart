class Group {

  int id;
  String name;
  String screenName;
  int isClosed;
  String type;
  String photo;

  Group(this.id,
      this.name,
      this.screenName,
      this.isClosed,
      this.type,
      this.photo);

  static Group parse(Map<String, dynamic> map) {
    Group user = new Group(
        map['id'],
        map['name'],
        map['screen_name'],
        map['is_closed'],
        map['type'],
        map['photo_100']
    );
    return user;
  }

  static List<Group> parseList(List users) {
    List<Group> parsedUsers = new List();
    if(users != null)
      users.forEach((map) => parsedUsers.add(parse(map)));
    return parsedUsers;
  }
}