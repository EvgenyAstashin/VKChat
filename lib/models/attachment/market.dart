import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/category.dart';
import 'package:vk_chat/models/attachment/price.dart';

part 'market.g.dart';

@JsonSerializable()
class Market extends Object with _$MarketSerializerMixin {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'price')
  Price price;
  @JsonKey(name: 'category')
  Category category;
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'thumb_photo')
  String thumbPhoto;
  @JsonKey(name: 'availability')
  int availability;
  @JsonKey(name: 'access_key')
  String accessKey;

  Market(this.id, this.ownerId, this.title, this.description, this.price,
      this.category, this.date, this.thumbPhoto, this.availability,
      this.accessKey);

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
}