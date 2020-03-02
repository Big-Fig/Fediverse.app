import 'dart:async';

import 'package:fedi/Pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel.dart';
import 'package:fedi/Pleroma/notifications/websockets/pleroma_notifications_websockets_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

var _logger = Logger("pleroma_notifications_websockets_channel_impl.dart");

class PleromaNotificationsWebSocketsChannel extends DisposableOwner
    implements IPleromaNotificationsWebSocketsChannel {
  final List<StreamController<PleromaNotificationsWebSocketsEvent>>
      streamControllers = List();

  @override
  PleromaNotificationsWebSocketsChannelSettings settings;

  IOWebSocketChannel _channel;

  DisposableOwner _channelDisposable;

  PleromaNotificationsWebSocketsChannel({@required this.settings}) {
    addDisposable(disposable: CustomDisposable(() {
      // disconnect
      _channelDisposable?.dispose();
    }));
  }

  void createChannel() {
    _logger.finest(() => "createChannel for $settings");
    var uri = createNotificationsWebSocketsUrl(settings: settings);

    _channel = IOWebSocketChannel.connect(uri);

    _channelDisposable = DisposableOwner();

    _channelDisposable.addDisposable(
        streamSubscription: _channel.stream.listen((data) {
      _logger.finest(() => "$uri data $data");

      if (data is String) {
        if (data?.isNotEmpty == true) {
          try {
            var event =
                PleromaNotificationsWebSocketsEvent.fromJsonString(data);
            _logger.finest(() => "$uri event $event");

            streamControllers.forEach((streamController) {
              streamController.add(event);
            });
          } catch (e) {
            _logger.severe(
                () => "$uri: failed to parse event from String($e): "
                    "$data, ",
                e);
          }
        }
      } else {
        _logger.severe(() => "$uri: failed to parse event from not String: "
            "$data");
      }
    }));
    _channelDisposable.addDisposable(disposable: CustomDisposable(() {
      // disconnect
      _channel.sink.close(status.goingAway);
    }));
  }

  @override
  replaceBaseUrlAndAuth(
      {@required String baseUrl, @required String accessToken}) {
    settings = PleromaNotificationsWebSocketsChannelSettings(
        baseUrl: baseUrl,
        accessToken: accessToken,
        stream: settings.stream,
        additionalQueryArgs: settings.additionalQueryArgs);

    _logger.finest(() => "replaceBaseUrlAndAuth after $settings");

    closeChannel();

    if (streamControllers.isNotEmpty) {
      createChannel();
    }
  }

  static Uri createNotificationsWebSocketsUrl(
      {@required PleromaNotificationsWebSocketsChannelSettings settings}) {
    var host = Uri.parse(settings.baseUrl).host;

    var queryArgs = {
      "access_token": settings.accessToken,
      "stream": settings.stream,
    };

    if (settings.additionalQueryArgs != null) {
      queryArgs.addAll(settings.additionalQueryArgs);
    }

    var queryArgsString = queryArgs.entries
        .map((entry) => "${entry.key}=${entry.value}")
        .join("&");

    var webSocketPath = "wss://$host/api/v1/streaming?$queryArgsString";
    _logger.finest(() => "createNotificationsWebSocketsUrl $webSocketPath");
    return Uri.parse(webSocketPath);
  }

  @override
  StreamController<PleromaNotificationsWebSocketsEvent>
      createEventsStreamController() {
    if (streamControllers.isEmpty) {
      createChannel();
    }

    StreamController<PleromaNotificationsWebSocketsEvent> streamController;
    streamController =
        StreamController<PleromaNotificationsWebSocketsEvent>(onCancel: () {
      streamControllers.remove(streamController);

      if (streamControllers.isEmpty) {
        closeChannel();
      }
    });

    streamControllers.add(streamController);

    return streamController;
  }

  void closeChannel() {
    _logger.finest(() => "closeChannel for $settings");
    _channelDisposable?.dispose();
    _channelDisposable = null;
    _channel = null;
  }

  @override
  Disposable listenEvents(
      Function(PleromaNotificationsWebSocketsEvent event) callback) {
    var streamController = createEventsStreamController();

    var disposable = DisposableOwner();

    disposable.addDisposable(
        streamSubscription: streamController.stream.listen(callback));
    disposable.addDisposable(disposable: CustomDisposable(() {
      streamController.close();
    }));
    return disposable;
  }
}
