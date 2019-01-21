// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
      json['product_id'] as int,
      json['sticker_id'] as int,
      (json['images'] as List)
          ?.map((e) =>
              e == null ? null : Image.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'product_id': instance.productId,
      'sticker_id': instance.stickerId,
      'images': instance.images
    };
