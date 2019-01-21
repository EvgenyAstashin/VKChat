import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/market.dart';

class MarketWidget extends StatelessWidget {

  final Market _market;

  MarketWidget(this._market);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(_market.title,
                style: TextStyle(color: Colors.blueAccent, fontSize: 16.0))),
        Text(_market.description, maxLines: 3, overflow: TextOverflow.ellipsis),
        Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 3.0),
            child: Text(_market.price.text,
                style: TextStyle(color: Colors.blueAccent, fontSize: 16.0))),
        Image.network(_market.thumbPhoto, height: 200.0, fit: BoxFit.fitWidth),
      ],
    );
  }
}
