import 'package:json_annotation/json_annotation.dart';

part 'chat_settings.g.dart';

@JsonSerializable()
class ChatSettings {

  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'members_count')
  int membersCount;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'photo')
  Map<String, dynamic> photo;
  @JsonKey(name: 'active_ids')
  List<dynamic> activeIds;

  ChatSettings(this.title, this.membersCount, this.state, this.photo,
      this.activeIds);

  factory ChatSettings.fromJson(Map<String, dynamic> json) => _$ChatSettingsFromJson(json);

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