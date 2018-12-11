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
              _buildTitle(),
              Text(_wall.text),
              Attachments(_wall.attachments)
            ]));
  }

  Widget _buildTitle() {
    if(_wall.from.isFromProfile())
      return _buildPostTitle("${_wall.from.firstName} ${_wall.from.lastName}", _wall.from.photo100);
    return _buildPostTitle(_wall.from.name, _wall.from.photo50);
  }

  Widget _buildPostTitle(String name, String icon) {
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
                    image: new NetworkImage(icon)))),
        Flexible(
            child: Text(name,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
