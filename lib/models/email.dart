class Email {

  int id;
  String address;

  Email(this.id, this.address);

  static Email parse(Map<String, dynamic> map) {
    Email user = new Email(
        map['id'],
        map['address']
    );
    return user;
  }

  static List<Email> parseList(List emails) {
    List<Email> parsedUsers = new List();
    if(emails != null)
      emails.forEach((map) => parsedUsers.add(parse(map)));
    return parsedUsers;
  }
}