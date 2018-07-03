class User {

  int id;
  String firstName;
  String lastName;
  String avatar;

  User(this.id, this.firstName, this.lastName, this.avatar);


  static User parseUser(Map<String, dynamic> map) {
    User user = new User(
      map['id'],
      map['first_name'],
      map['last_name'],
      map['photo_100']
    );
    return user;
  }

  static List<User> parseUserList(List users) {
    List<User> parsedUsers = new List();
    users.forEach((map) => parsedUsers.add(parseUser(map)));
    return parsedUsers;
  }
}