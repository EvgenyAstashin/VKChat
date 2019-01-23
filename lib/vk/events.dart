class Events {

  static const int NEW_MESSAGE = 4;
  static const int USER_ONLINE = 8;
  static const int USER_OFFLINE = 9;
  static const int USER_IS_TYPING = 61;

  static List<Event>parse(List<dynamic> events) {
    List<Event> list = List();
    events.forEach((event) => list.add(_parseEvent(event)));
    return list;
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
        case USER_IS_TYPING:
          return UserIsTyping().parse(eventInnards);
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
    return this;
  }
}

class UserOffline extends Event {

  UserOffline() : super(Events.USER_OFFLINE);

  @override
  Event parse(eventInnards) {
    return this;
  }
}

class UserIsTyping extends Event {

  int userId;
  int flags;
  
  UserIsTyping() : super(Events.USER_IS_TYPING);

  @override
  Event parse(List eventInnards) {
    userId = eventInnards[1];
    flags = eventInnards[2];
    return this;
  }
}
