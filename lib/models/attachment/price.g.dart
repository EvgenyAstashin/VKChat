// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) {
  return new Price(
      json['amount'] as String,
      json['currency'] == null
          ? null
          : new Currency.fromJson(json['currency'] as Map<String, dynamic>),
      json['text'] as String);
}

abstract class _$PriceSerializerMixin {
  String get amount;
  Currency get currency;
  String get text;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'amount': amount, 'currency': currency, 'text': text};
}
