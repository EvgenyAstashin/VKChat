import 'package:flutter/material.dart';
import 'package:vk_chat/ui/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'VKchat',
      home: new HomePage()
    );
  }
}
