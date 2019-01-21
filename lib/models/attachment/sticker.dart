import 'package:json_annotation/json_annotation.dart';
import 'package:vk_chat/models/attachment/image.dart';

part 'sticker.g.dart';

@JsonSerializable()
class Sticker {

  @JsonKey(name: 'product_id')
  int productId;
  @JsonKey(name: 'sticker_id')
  int stickerId;
  @JsonKey(name: 'images')
  List<Image> images;


  Sticker(this.productId, this.stickerId, this.images);

  factory Sticker.fromJson(Map<String, dynamic> json) => _$StickerFromJson(json);
}