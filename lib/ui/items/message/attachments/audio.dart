import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vk_chat/models/attachment/audio.dart';

class AudioWidget extends StatelessWidget {
  Audio _audio;

  AudioWidget(this._audio);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.0),
          child: Stack(children: <Widget>[
            Icon(Icons.play_circle_outline,
              size: 45.0, color: Colors.blueAccent)
          ],)
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_audio.artist,
                style: TextStyle(color: Colors.blueAccent),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(_audio.title, maxLines: 1, overflow: TextOverflow.ellipsis)
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(_parseDuration(_audio.duration),
                style: TextStyle(color: Colors.blueAccent)))
      ],
    );
  }

  String _parseDuration(int duration) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(duration * 1000, isUtc: true);
    if (duration < 3600) return new DateFormat("mm:ss").format(dateTime);
    return new DateFormat("hh:mm:ss").format(dateTime);
  }
}
