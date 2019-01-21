import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/sticker.dart';

class StickerWidget extends StatelessWidget {

  final Sticker _sticker;

  StickerWidget(this._sticker);

  @override
  Widget build(BuildContext context) {
    var image = _sticker.images.last;

    return Padding(
        padding: new EdgeInsets.only(top: 5.0),
        child: AspectRatio(
            aspectRatio: image.width / image.height,
            child: Image.network(image.url))
    );
  }

}