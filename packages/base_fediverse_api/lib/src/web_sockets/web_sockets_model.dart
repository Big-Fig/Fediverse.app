typedef WebSocketsEventParser<T extends WebSocketsEvent> = T Function(
  Map<String, dynamic> json,
);

class WebSocketsEvent {}
