import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends Object {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'photo_100')
  String avatar;
  @JsonKey(name: 'online')
  int online;
  @JsonKey(name: 'first_name_acc')
  String firstNameAcc;
  @JsonKey(name: 'last_name_acc')
  String lastNameAcc;
  @JsonKey(name: 'sex')
  int sex;

  Profile(this.id, this.firstName, this.lastName, this.avatar, this.online, this.firstNameAcc, this.lastNameAcc, this.sex);

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  static List<Profile> parseList(List profiles) {
    return profiles?.map((e) => e == null
        ? null
        : new Profile.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }
}