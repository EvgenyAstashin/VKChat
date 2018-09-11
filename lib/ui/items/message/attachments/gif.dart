import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/doc.dart';

class GifWidget extends StatelessWidget {

  Doc _doc;

  GifWidget(this._doc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.only(top: 5.0),
      child: AspectRatio (
      aspectRatio: _doc.preview.photo.sizes.last.width / _doc.preview.photo.sizes.last.height,
      child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
        Image.network(_doc.preview.photo.sizes.last.src, fit: BoxFit.fitWidth),
        Center(
            child: Icon(Icons.play_circle_outline,
                size: 40.0, color: Colors.white))
      ]),
    ));
  }
}