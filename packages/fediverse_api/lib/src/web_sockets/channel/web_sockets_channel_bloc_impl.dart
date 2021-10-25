import 'dart:async';
import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

import '../event/web_sockets_event_model.dart';
import '../mode/settings/web_sockets_mode_settings_bloc.dart';
import 'handler/type/websockets_channel_handler_type_model.dart';
import 'handler/web_sockets_channel_handler_bloc.dart';
import 'web_sockets_channel_bloc.dart';
import 'web_sockets_channel_model.dart';

var _logger = Logger('web_sockets_channel_bloc_impl.dart');

class WebSocketsChannelBloc<T extends IWebSocketsEvent> extends DisposableOwner
    implements IWebSocketsChannelBloc<T> {
  StreamController<T> eventsStreamController = StreamController.broadcast();

  final BehaviorSubject<bool> isActiveSubject = BehaviorSubject.seeded(false);

  @override
  bool get isActive => isActiveSubject.value;

  @override
  Stream<bool> get isActiveStream => isActiveSubject.stream;

  @override
  Stream<T> get eventsStream => eventsStreamController.stream;
  @override
  final IWebSocketsChannelConfig config;

  @override
  final IWebSocketsModeSettingsBloc webSocketsModeSettingsBloc;
  final WebSocketsEventParser<T> eventParser;

  final BehaviorSubject<
          Map<IWebSocketsChannelHandlerBloc<IWebSocketsEvent>, IDisposable>>
      handlersMapSubject = BehaviorSubject.seeded({});

  Map<IWebSocketsChannelHandlerBloc, IDisposable> get handlersMap =>
      handlersMapSubject.value;

  Stream<Map<IWebSocketsChannelHandlerBloc, IDisposable>>
      get handlersMapStream => handlersMapSubject.stream;

  @override
  List<IWebSocketsChannelHandlerBloc> get handlers => handlersMap.keys.toList();

  @override
  Stream<List<IWebSocketsChannelHandlerBloc>> get handlersStream =>
      handlersMapStream.map(
        (handlers) => handlersMapSubject.value.keys.toList(),
      );

  WebSocketsChannelBloc({
    required this.webSocketsModeSettingsBloc,
    required this.config,
    required this.eventParser,
  }) {
    webSocketsModeSettingsBloc.modeStream.listen((event) {
      _checkConnection();
    }).disposeWith(this);
    isActiveSubject.disposeWith(this);
    handlersMapSubject.disposeWith(this);
    addCustomDisposable(
      () async {
        // concurrency
        var tmp = handlers.toList();
        for (final handler in tmp) {
          await handler.dispose();
        }
      },
    );
    addCustomDisposable(
      _disconnect,
    );
  }

  IOWebSocketChannel? _channel;
  StreamSubscription? _channelSubscription;

  void _connect() {
    assert(!isActive, 'already connected');

    var channel = IOWebSocketChannel.connect(
      config.url,
    );
    isActiveSubject.add(true);
    _channel = channel;
    _channelSubscription = channel.stream.listen(
      (dynamic message) {
        _logger.finest(() => '$config message $message');
        var event = _mapChannelData(message);
        if (event != null) {
          eventsStreamController.add(event);
        }
      },
      onDone: () {
        _logger.finest(() => 'ws channel closed $config');
      },
      onError: (dynamic error) {
        _logger.shout(() => 'ws error $error');
      },
    );
  }

  Future<void> _disconnect() async {
    _logger.finest(() => '_disconnect $config');
    isActiveSubject.add(false);
    await _channelSubscription?.cancel();
    // ignore: avoid-ignoring-return-values
    await _channel?.sink.close();
    _channel = null;
  }

  T? _mapChannelData(dynamic data) {
    if (data is String) {
      if (data.isNotEmpty) {
        try {
          var json = jsonDecode(data) as Map<String, dynamic>;
          var event = eventParser(json);
          _logger.finest(() => '$config event $event');

          return event;
          // ignore: avoid_catches_without_on_clauses
        } catch (e) {
          _logger.shout(
            () => '$config: failed to parse event from String($e): '
                '$data, ',
            e,
          );

          return null;
        }
      } else {
        return null;
      }
    } else {
      _logger.severe(
        () => '$config: failed to parse event from not String: '
            '$data',
      );

      return null;
    }
  }

  @override
  void addHandler(IWebSocketsChannelHandlerBloc<IWebSocketsEvent> handler) {
    var disposable = CompositeDisposable();
    handler.isHaveListenersStream.listen((event) {
      _checkConnection();
    }).disposeWith(disposable);
    handler.handlerTypeStream.listen((event) {
      _checkConnection();
    }).disposeWith(disposable);
    handlersMap[handler] = disposable;
    handlersMapSubject.add(handlersMap);
  }

  @override
  void removeHandler(IWebSocketsChannelHandlerBloc<IWebSocketsEvent> handler) {
    var disposable = handlersMap.remove(handler);
    if (disposable != null) {
      disposable.dispose();
      handlersMapSubject.add(handlersMap);
    } else {
      _logger.warning(
        () => 'failed to remove $handler, '
            'it not exist in handlersMap',
      );
    }
  }

  bool _checkConnectionInProgress = false;

  void _checkConnection() {
    if (_checkConnectionInProgress) {
      return;
    }
    _checkConnectionInProgress = true;

    try {
      var shouldBeActive = webSocketsModeSettingsBloc.mode.map(
        disabled: (_) => false,
        onlyForeground: (_) => handlers.fold(
          false,
          (bool previousValue, handler) =>
              previousValue ||
              handler.isHaveListeners &&
                  handler.handlerType ==
                      WebSocketsChannelHandlerType.foregroundValue,
        ),
        foregroundAndBackground: (_) => handlers.fold(
          false,
          (bool previousValue, handler) =>
              previousValue || handler.isHaveListeners,
        ),
      );

      if (isActive && !shouldBeActive) {
        _disconnect();
      } else if (!isActive && shouldBeActive) {
        _connect();
      }
    } finally {
      _checkConnectionInProgress = false;
    }
  }
}
