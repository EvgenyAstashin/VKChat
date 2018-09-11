import 'package:vk_chat/models/attachment/currency.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price extends Object with _$PriceSerializerMixin {

  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'currency')
  Currency currency;
  @JsonKey(name: 'text')
  String text;

  Price(this.amount, this.currency, this.text);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}