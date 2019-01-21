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
      'app_name':'VKchat',
      'messages': 'Messages',
      'message': 'Message',
      'friends': "Friends",
      'settings': 'Settings',
      'show_online': 'Show status \"online\"',
      'mark_as_readed': 'Mark messages as readed',
      'notification': 'Notification',
      'color_scheme': 'Color scheme',
      'exit': 'Exit',

      //conversation actions male
      'left_conversation': 'left the conversation',
      'create_conversation': 'created conversation',
      'change_conversation_title': 'changed conversation title -> ',
      'conversation_icon_update': 'updated conversation icon',
      'conversation_icon_remove': 'removed conversation icon',
      'invite_user': 'invited',
      'invite_user_by_link': 'joined the conversation',
      'chat_kicked_user': 'excluded',
      'pin_message': 'pin the message',
      'unpin_message': 'unpin the message',
      //conversation actions female
      'left_conversation_f': 'left the conversation',
      'create_conversation_f': 'created conversation',
      'change_conversation_title_f': 'changed conversation title -> ',
      'conversation_icon_update_f': 'updated conversation icon',
      'conversation_icon_remove_f': 'removed conversation icon',
      'invite_user_f': 'invited',
      'invite_user_by_link_f': 'joined the conversation',
      'chat_kicked_user_f': 'excluded',
      'pin_message_f': 'pin the message',
      'unpin_message_f': 'unpin the message',

      'online': 'online'

    },
    'ru': {
      'app_name':'VKchat',
      'messages': 'Сообщения',
      'message': 'Сообщение',
      'friends': "Друзья",
      'settings': 'Настройки',
      'show_online': 'Отображать статус \"online\"',
      'mark_as_readed': 'Помечать сообщения как прочитанные',
      'notification': 'Уведомления',
      'color_scheme': 'Цветовая схема',
      'exit': 'Выход',

      //conversation actions
      'left_conversation': 'покинул беседу',
      'create_conversation': 'создал беседу',
      'change_conversation_title': 'изменил назввание беседы -> ',
      'conversation_icon_update': 'обновил фотографию беседы',
      'conversation_icon_remove': 'удалил фотографию беседы',
      'invite_user': 'пригласил',
      'invite_user_by_link': 'присоединился к беседе',
      'chat_kicked_user': 'исключил',
      'pin_message': 'закрепил сообщение',
      'unpin_message': 'открепил сообщение',
      //conversation actions female
      'left_conversation_f': 'покинула беседу',
      'create_conversation_f': 'создала беседу',
      'change_conversation_title_f': 'изменила назввание беседы -> ',
      'conversation_icon_update_f': 'обновила фотографию беседы',
      'conversation_icon_remove_f': 'удалила фотографию беседы',
      'invite_user_f': 'пригласила',
      'invite_user_by_link_f': 'присоединилась к беседе',
      'chat_kicked_user_f': 'исключила',
      'pin_message_f': 'закрепила сообщение',
      'unpin_message_f': 'открепила сообщение',

      'online': 'online'
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