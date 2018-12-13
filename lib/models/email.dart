import 'package:json_annotation/json_annotation.dart';

part 'email.g.dart';

@JsonSerializable()
class Email {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'address')
  String address;

  Email(this.id, this.address);

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  static List<Email> parseList(List emails) {
    List<Email> parsedUsers = new List();
    if(emails != null)
      emails.forEach((map) => parsedUsers.add(Email.fromJson(map)));
    return parsedUsers;
  }
}