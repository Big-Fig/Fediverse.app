import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/refactored/websockets/websockets_channel_source.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';

class WebSocketsChannelSourceMock<T extends WebSocketsEvent>
    extends DisposableOwner implements IWebSocketsChannelSource<T> {
  @override
  Stream<T> get eventsStream => _eventsStreamController.stream;
  StreamController<T> _eventsStreamController = StreamController();

  addEvent(T event) {
    _eventsStreamController.add(event);
  }

  @override
  final Uri url;

  WebSocketsChannelSourceMock({@required this.url}) {
    addDisposable(disposable: CustomDisposable(() {
      _eventsStreamController.close();
    }));
  }
}
