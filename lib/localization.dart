import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class VkChatLocalizations {

  static VkChatLocalizations _instance;

  VkChatLocalizations(Locale locale) {
    VkChatLocalizations.locale = locale;
  }

  static VkChatLocalizations build(Locale locale) {
    if(_instance == null)
      _instance = VkChatLocalizations(locale);
    return _instance;
  }

  static Locale locale = Locale('en', 'US');

  static VkChatLocalizations of(BuildContext context) {
    return Localizations.of<VkChatLocalizations>(context, VkChatLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'messages': 'Messages',
      'message': 'Message',
      'friends': "Friends",
      'settings': 'Settings',
      'show_online': 'Show status \"online\"',
      'mark_as_readed': 'Mark messages as readed',
      'notification': 'Notification',
      'color_scheme': 'Color scheme',
      'exit': 'Exit',
    },
    'ru': {
      'messages': 'Сообщения',
      'message': 'Сообщение',
      'friends': "Друзья",
      'settings': 'Настройки',
      'show_online': 'Отображать статус \"online\"',
      'mark_as_readed': 'Помечать сообщения как прочитанные',
      'notification': 'Уведомления',
      'color_scheme': 'Цветовая схема',
      'exit': 'Выход',
    },
  };

  static String get(String str) {
    return _getLocalizedValues()[str];
  }

  static Map<String, String> _getLocalizedValues() {
    if(_localizedValues.containsKey(locale.languageCode))
      return _localizedValues[locale.languageCode];
    return _localizedValues['en'];
  }
}

class VkChatLocalizationsDelegate extends
LocalizationsDelegate<VkChatLocalizations> {

  const VkChatLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<VkChatLocalizations> load(Locale locale) {
    return SynchronousFuture<VkChatLocalizations>
      (VkChatLocalizations.build(locale));
  }

  @override
  bool shouldReload(VkChatLocalizationsDelegate old) => false;
}