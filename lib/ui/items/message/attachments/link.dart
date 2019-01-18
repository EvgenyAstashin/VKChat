import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/link.dart';

class LinkWidget extends StatelessWidget {

  Link _link;

  LinkWidget(this._link);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 3.0),
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Image.network(_link.photo.sizes.last.url, height: 150.0,fit: BoxFit.fitHeight),
          Container(color: Colors.black38, height: 150.0,),
          Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 5.0),
                    child :Text(_link.title, style: TextStyle(color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis)),
                RaisedButton(onPressed:() {},color: Colors.white, child: Text(_link.button != null ? _link.button.title : 'Открыть'),)
              ])
        )]));
  }
}