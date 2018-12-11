import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/doc.dart';
import 'package:vk_chat/ui/items/message/attachments/gif.dart';

class DocWidget extends StatelessWidget {
  Doc _doc;

  DocWidget(this._doc);

  @override
  Widget build(BuildContext context) {
    if (_doc.ext == "gif") return GifWidget(_doc);
    return _buildDoc(_doc);
  }

  Widget _buildDoc(Doc doc) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin: EdgeInsets.only(right: 5.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Icon(Icons.insert_drive_file,
                    size: 35.0, color: Colors.blueAccent),
                Text(doc.ext,
                    style: TextStyle(color: Colors.white, fontSize: 12.0))
              ],
            )),
        Flexible(
            child: Text(
          doc.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16.0),
        ))
      ],
    );
  }
}
