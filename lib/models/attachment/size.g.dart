// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Size _$SizeFromJson(Map<String, dynamic> json) {
  return Size(json['type'] as String, json['url'] as String,
      json['width'] as int, json['height'] as int, json['src'] as String);
}

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'src': instance.src,
      'width': instance.width,
      'height': instance.height
    };
