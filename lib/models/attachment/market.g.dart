// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) {
  return new Market(
      json['id'] as int,
      json['owner_id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['price'] == null
          ? null
          : new Price.fromJson(json['price'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : new Category.fromJson(json['category'] as Map<String, dynamic>),
      json['date'] as int,
      json['thumb_photo'] as String,
      json['availability'] as int,
      json['access_key'] as String);
}

abstract class _$MarketSerializerMixin {
  int get id;
  int get ownerId;
  String get title;
  String get description;
  Price get price;
  Category get category;
  int get date;
  String get thumbPhoto;
  int get availability;
  String get accessKey;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'owner_id': ownerId,
        'title': title,
        'description': description,
        'price': price,
        'category': category,
        'date': date,
        'thumb_photo': thumbPhoto,
        'availability': availability,
        'access_key': accessKey
      };
}
