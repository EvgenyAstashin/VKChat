// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) {
  return Market(
      json['id'] as int,
      json['owner_id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      json['date'] as int,
      json['thumb_photo'] as String,
      json['availability'] as int,
      json['access_key'] as String);
}

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'date': instance.date,
      'thumb_photo': instance.thumbPhoto,
      'availability': instance.availability,
      'access_key': instance.accessKey
    };
