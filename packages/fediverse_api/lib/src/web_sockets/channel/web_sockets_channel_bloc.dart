import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';

import '../event/web_sockets_event_model.dart';
import '../mode/settings/web_sockets_mode_settings_bloc.dart';
import 'handler/web_sockets_channel_handler_bloc.dart';
import 'web_sockets_channel_model.dart';

abstract class IWebSocketsChannelBloc<T extends IWebSocketsEvent>
    implements IDisposable {
  bool get isActive;

  Stream<bool> get isActiveStream;

  List<IWebSocketsChannelHandlerBloc> get handlers;

  Stream<List<IWebSocketsChannelHandlerBloc>> get handlersStream;

  void addHandler(IWebSocketsChannelHandlerBloc handler);

  void removeHandler(IWebSocketsChannelHandlerBloc handler);

  IWebSocketsModeSettingsBloc get webSocketsModeSettingsBloc;

  IWebSocketsChannelConfig get config;

  Stream<T> get eventsStream;
}
