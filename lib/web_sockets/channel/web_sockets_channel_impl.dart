import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_source.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("web_sockets_channel_impl.dart");

class WebSocketsChannel<T extends WebSocketsEvent> extends DisposableOwner
    implements IWebSocketsChannel<T> {
  @override
  final IWebSocketsChannelConfig<T> config;

  IWebSocketsChannelSource _source;
  StreamSubscription<T> _sourceSubscription;

  // ignore: close_sinks
  StreamController<T> _eventsStreamController;

  @override
  Stream<T> get eventsStream => _eventsStreamController.stream;

  @override
  bool get isPaused => !_eventsStreamController.hasListener;

  WebSocketsChannel({@required this.config}) {
    _logger.finest(() => "constructor $config");
    _eventsStreamController =
        StreamController.broadcast(onCancel: _onCancel, onListen: _onListen);

    addDisposable(disposable: CustomDisposable(() async {
      await _eventsStreamController.close();
    }));
    addDisposable(disposable: CustomDisposable(() async {
      await _source?.dispose();
      await _sourceSubscription?.cancel();
    }));
  }

  void _onCancel() {
    _logger.finest(() => "_onPause");
    _source?.dispose();
    _sourceSubscription?.cancel();
    _source = null;
    _sourceSubscription = null;
  }

  void _onListen() {
    _logger.finest(() => "_onResume");
    _source = config.createChannelSource();
    _sourceSubscription = _source.eventsStream
        .skipWhile((event) => event == null)
        .listen((event) {
      _logger.finest(() => "newEvent event");
      _eventsStreamController.add(event);
    });
  }
}
