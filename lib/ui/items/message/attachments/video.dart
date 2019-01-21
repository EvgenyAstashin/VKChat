import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/models/attachment/video.dart';

class VideoWidget extends StatelessWidget {

  final Video _video;

  VideoWidget(this._video);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: new EdgeInsets.only(top: 5.0, bottom: 3.0),
        child: AspectRatio (
          aspectRatio: _video.width / _video.height,
          child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
            Image.network(_video.photo320, fit: BoxFit.fitWidth),
            Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(Icons.play_circle_outline, size: 40.0, color: Colors.white),
                  Padding(padding: EdgeInsets.only(top: 5.0), child: Text(_parseDuration(_video.duration), style: TextStyle(color: Colors.white),))
                ],))
          ]),
        ));
  }

  String _parseDuration(int duration) {
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(duration * 1000, isUtc: true);
    if(duration < 3600)
      return new DateFormat("mm:ss").format(dateTime);
    return new DateFormat("hh:mm:ss").format(dateTime);
  }
}