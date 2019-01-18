import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/link.dart';

import 'package:url_launcher/url_launcher.dart';

class LinkWidget extends StatelessWidget {
  final Link _link;

  LinkWidget(this._link);

  @override
  Widget build(BuildContext context) {
    if (_link.photo != null) return _buildLinkWithPhoto();
    return _buildLinkWithoutPhoto();
  }

  Widget _buildLinkWithPhoto() {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 3.0),
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Image.network(_link.photo.sizes.last.url,
              height: 150.0, fit: BoxFit.fitHeight),
          Container(
            color: Colors.black38,
            height: 150.0,
          ),
          Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 5.0),
                child: Text(_link.title,
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis)),
            RaisedButton(
              onPressed: () {
                _open(_link.url);
              },
              color: Colors.white,
              child:
                  Text(_link.button != null ? _link.button.title : 'Открыть'),
            )
          ]))
        ]));
  }

  Widget _buildLinkWithoutPhoto() {
    return new Container(
        margin: const EdgeInsets.only(left: 5.0, bottom: 3.0),
        padding: const EdgeInsets.only(left: 3.0),
        decoration: new BoxDecoration(
            border: new Border(
                top: BorderSide.none,
                bottom: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(color: Colors.blueAccent, width: 3.0))),
        child: GestureDetector(
            onTap: () {
              _open(_link.url);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(_link.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0))),
                Text(
                  _link.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black38),
                )
              ],
            )));
  }

  static void _open(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
