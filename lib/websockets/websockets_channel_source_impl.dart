import 'dart:convert';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/websockets/websockets_channel_source.dart';
import 'package:fedi/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/io.dart';

var _logger = Logger("websockets_channel_source.dart");

class WebSocketsChannelSource<T extends WebSocketsEvent> extends DisposableOwner
    implements IWebSocketsChannelSource<T> {
  @override
  Stream<T> get eventsStream => _channel.stream.map(_mapChannelData);
  @override
  final Uri url;
  final WebSocketsEventParser<T> eventParser;

  final IOWebSocketChannel _channel;

  WebSocketsChannelSource({@required this.url, @required this.eventParser})
      : _channel = IOWebSocketChannel.connect(url) {
    addDisposable(disposable: CustomDisposable(() {
      _channel.sink.close();
    }));
  }

  T _mapChannelData(data) {
    if (data is String) {
      if (data?.isNotEmpty == true) {
        try {
          var json = jsonDecode(data);
          var event = eventParser(json);
          _logger.finest(() => "$url event $event");

          return event;
        } catch (e) {
          _logger.severe(
              () => "$url: failed to parse event from String($e): "
                  "$data, ",
              e);
          return null;
        }
      } else {
        return null;
      }
    } else {
      _logger.severe(() => "$url: failed to parse event from not String: "
          "$data");
      return null;
    }
  }
}
