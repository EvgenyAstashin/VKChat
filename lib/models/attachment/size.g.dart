// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Size _$SizeFromJson(Map<String, dynamic> json) {
  return new Size(json['type'] as String, json['url'] as String,
      json['width'] as int, json['height'] as int, json['src'] as String);
}

abstract class _$SizeSerializerMixin {
  String get type;
  String get url;
  String get src;
  int get width;
  int get height;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url': url,
        'src': src,
        'width': width,
        'height': height
      };
}
