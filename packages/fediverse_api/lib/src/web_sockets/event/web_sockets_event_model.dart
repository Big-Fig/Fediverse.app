typedef WebSocketsEventParser<T extends IWebSocketsEvent> = T Function(
  Map<String, dynamic> json,
);

class IWebSocketsEvent {}
