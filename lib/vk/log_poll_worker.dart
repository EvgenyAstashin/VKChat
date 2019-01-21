import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:event_bus/event_bus.dart';
import 'package:vk_chat/vk/events.dart';
import 'package:vk_chat/vk/vk.dart';

class LongPollWorker {
  EventBus _eventBus;

  String _server;
  String _key;
  int _ts;

  bool cancelled = false;

  LongPollWorker(this._eventBus);

  void init(String server, String key, int ts) {
    this._server = server;
    this._key = key;
    this._ts = ts;
  }

  void startPooling() {
    print("pooling startPooling " + _buildUrl());
    if (!cancelled)
      _getUpdates().then((http.Response response) {
        print("pooling " + response.body);
        Map<String, dynamic> map = json.decode(response.body);
        if (map.containsKey('failed')) {
          VK().startLongPoll();
        } else {
          _ts = map['ts'];
          _update(map['updates']);
          startPooling();
        }
      });
  }

  EventBus getBus() {
    return _eventBus;
  }

  Future<http.Response> _getUpdates() {
    return http.get(_buildUrl());
  }

  String _buildUrl() {
    return 'https://' +
        _server +
        '?act=a_check&key=' +
        _key +
        '&ts=' +
        _ts.toString() +
        '&wait=25&mode=2&version=2';
  }

  void _update(List<dynamic> events) {
    Map<int, List<Event>> eventsMap = Events.parse(events);
    eventsMap.forEach((eventKey, eventsList) => _eventBus.fire(eventsList));
  }
}
