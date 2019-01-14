import 'package:flutter/material.dart';
import 'package:vk_chat/localization.dart';
import 'package:vk_chat/preferences.dart';
import 'package:vk_chat/vk/vk.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  TextStyle _textStyle = TextStyle(fontSize: 16.0);

  Preferences prefs = Preferences();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 15.0),
      child: Column(
        children: <Widget>[
          _createSwitch(VkChatLocalizations.get('show_online'),
              prefs.settings.showAsOnline, _statusOnlineChanged),
          _divider(),
          _createSwitch(VkChatLocalizations.get('mark_as_readed'),
              prefs.settings.markAsRead, _markAsReadChanged),
          _divider(),
          _pushNotification(),
          _divider(),
          _colorScheme()
        ],
      ),
    );
  }

  Widget _createSwitch(
      String title, bool enable, ValueChanged<bool> onChanged) {
    return Container(
        height: 45.0,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              title,
              style: _textStyle,
            )),
            Switch(
              value: enable,
              onChanged: onChanged,
            )
          ],
        ));
  }

  Widget _pushNotification() {
    return Container(
        height: 45.0,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
                  VkChatLocalizations.get('notification'),
              style: _textStyle,
            )),
            IconButton(
              icon: new Icon(Icons.keyboard_arrow_right),
              color: Colors.blueAccent,
              onPressed: () {},
            )
          ],
        ));
  }

  Widget _colorScheme() {
    return Container(
        height: 45.0,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
                  VkChatLocalizations.get('color_scheme'),
              style: _textStyle,
            )),
            Container(
                margin: EdgeInsets.only(right: 15.0),
                width: 25.0,
                height: 25.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueAccent))
          ],
        ));
  }

  Widget _divider() {
    return Container(
        margin: EdgeInsets.only(right: 10.0), height: 1.0, color: Colors.grey);
  }

  void _statusOnlineChanged(bool status) {
    setState(() {
      prefs.saveShowOnline(status);
      VK().updateOnline();
    });
  }

  void _markAsReadChanged(bool status) {
    setState(() {
      prefs.saveMarkAsRead(status);
    });
  }
}
