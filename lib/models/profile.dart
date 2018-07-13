class Profile {

  int id;
  String firstName;
  String lastName;
  String avatar;

  Profile(this.id, this.firstName, this.lastName, this.avatar);


  static Profile parse(Map<String, dynamic> map) {
    Profile user = new Profile(
      map['id'],
      map['first_name'],
      map['last_name'],
      map['photo_100']
    );
    return user;
  }

  static List<Profile> parseList(List users) {
    List<Profile> parsedUsers = new List();
    users.forEach((map) => parsedUsers.add(parse(map)));
    return parsedUsers;
  }
}