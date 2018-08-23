import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends Object with _$ProfileSerializerMixin {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'photo_100')
  String avatar;

  Profile(this.id, this.firstName, this.lastName, this.avatar);

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  static List<Profile> parseList(List profiles) {
    return profiles?.map((e) => e == null
        ? null
        : new Profile.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }
}