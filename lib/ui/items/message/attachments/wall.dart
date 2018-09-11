import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/wall.dart';
import 'package:vk_chat/ui/items/message/attachments/attachments.dart';

class WallWidget extends StatelessWidget {

  Wall _wall;

  WallWidget(this._wall);

  @override
  Widget build(BuildContext context) {
    return _buildAttachment();
  }

  Widget _buildAttachment() {
    if (_wall != null) {
      if (_wall.postType == 'post') return _buildPost();
    }
    return Text("Wall widget");
  }

  Widget _buildPost() {
    return new Container(
        margin: const EdgeInsets.only(left: 5.0, bottom: 3.0),
        padding: const EdgeInsets.only(left: 3.0),
        decoration: new BoxDecoration(
            border: new Border(
                top: BorderSide.none,
                bottom: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(color: Colors.blueAccent, width: 3.0))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildPostTitle(),
              Text(_wall.text),
              Attachments(_wall.attachments)
            ]));
  }

  Widget _buildPostTitle() {
    return Row(
      children: <Widget>[
        Container(
            width: 30.0,
            height: 30.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(_wall.from.photo50)))),
        Flexible(
            child: Text(_wall.from.name,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
