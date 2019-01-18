import 'package:flutter_linkify/flutter_linkify.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkableText extends Linkify {

  const LinkableText({
    String text,
    TextStyle style,
    TextStyle linkStyle
  }) : super(text: text, style: style, linkStyle: linkStyle, onOpen: _open);

  static void _open(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}