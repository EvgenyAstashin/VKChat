class Events {

  static const int NEW_MESSAGE = 4;
  static const int USER_ONLINE = 8;
  static const int USER_OFFLINE = 9;

  static Map<int, List<Event>> parse(List<dynamic> events) {
    Map<int, List<Event>> map = new Map();
    events.forEach((event) => _parse(event, map));
    return map;
  }

  static void _parse(dynamic event, Map<int, List<Event>> map) {
    Event parsedEvent = _parseEvent(event);
    if(parsedEvent != null)
      _addToMap(parsedEvent, map);
  }

  static void _addToMap(Event event, Map<int, List<Event>> map) {
    if(!map.containsKey(event.eventKey))
      map.putIfAbsent(event.eventKey, () => new List<Event>());
    map[event.eventKey].add(event);
  }

  static Event _parseEvent(dynamic event) {
    List<dynamic> eventInnards = event;

    if(eventInnards.length != 0) {
      switch (eventInnards[0]) {
        case NEW_MESSAGE:
          return NewMessage().parse(eventInnards);
        case USER_ONLINE:
          return UserOnline().parse(eventInnards);
        case USER_OFFLINE:
          return UserOffline().parse(eventInnards);
      }

    }

    return null;
  }

}

abstract class Event {

  int eventKey;

  Event(this.eventKey);

  Event parse(List<dynamic> eventInnards);
}

class NewMessage extends Event {

  int messageId;
  int flags;
  int peerId;

  NewMessage() : super(Events.NEW_MESSAGE);

  @override
  Event parse(eventInnards) {
    messageId = eventInnards[1];
    flags = eventInnards[2];
    peerId = eventInnards[3];
    return this;
  }
}

class UserOnline extends Event {

  UserOnline() : super(Events.USER_ONLINE);

  @override
  Event parse(eventInnards) {
    // TODO: implement parse
    return this;
  }
}

class UserOffline extends Event {

  UserOffline() : super(Events.USER_OFFLINE);

  @override
  Event parse(eventInnards) {
    // TODO: implement parse
    return this;
  }
}
