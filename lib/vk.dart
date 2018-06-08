import 'dart:async';

import 'package:flutter/services.dart';

class VK {
  static const platform = const MethodChannel('vk_plugin');

  Future login(void result(bool isLoggedIn)) async {
    try {
      result(await platform.invokeMethod('login'));
    } on PlatformException catch (e) {
      result(false);
    }
  }
}
