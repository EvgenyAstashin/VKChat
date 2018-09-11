import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency extends Object with _$CurrencySerializerMixin {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  Currency(this.id, this.name);

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}