import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/attachment.dart';
import 'package:vk_chat/models/attachment/photo.dart';

class PhotoWidget extends StatelessWidget {

  Photo _photo;

  PhotoWidget(this._photo);

  @override
  Widget build(BuildContext context) {
        return Padding(
        padding: new EdgeInsets.only(top: 5.0),
        child: AspectRatio(
            aspectRatio: _photo.sizes.last.width / _photo.sizes.last.height,
            child: Image.network(_photo.sizes.last.url))
    );
  }
}