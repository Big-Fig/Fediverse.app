import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:rxdart/rxdart.dart';

import '../../event/web_sockets_event_model.dart';
import '../../listener/web_sockets_listener_model.dart';
import '../web_sockets_channel_bloc.dart';
import 'type/websockets_channel_handler_type_model.dart';
import 'web_sockets_channel_handler_bloc.dart';

class WebSocketsChannelHandlerBloc<T extends IWebSocketsEvent>
    extends DisposableOwner implements IWebSocketsChannelHandlerBloc<T> {
  final BehaviorSubject<List<IWebSocketsChannelHandlerListener<T>>>
      listenersSubject = BehaviorSubject.seeded(
    <IWebSocketsChannelHandlerListener<T>>[],
  );

  final BehaviorSubject<WebSocketsChannelHandlerType> handlerTypeSubject;

  IWebSocketsChannelBloc<T> channelBloc;

  WebSocketsChannelHandlerBloc({
    required WebSocketsChannelHandlerType handlerType,
    required this.channelBloc,
  }) : handlerTypeSubject = BehaviorSubject.seeded(handlerType) {
    channelBloc.addHandler(this);
    listenersSubject.disposeWith(this);

    channelBloc.eventsStream.listen((event) {
      for (final listener in listeners) {
        listener.onEvent(event);
      }
    }).disposeWith(this);

    addCustomDisposable(
      () async {
        channelBloc.removeHandler(this);
      },
    );
  }

  @override
  WebSocketsChannelHandlerType get handlerType => handlerTypeSubject.value;

  @override
  Stream<WebSocketsChannelHandlerType> get handlerTypeStream =>
      handlerTypeSubject.stream;

  @override
  IDisposable listenForEvents({
    required IWebSocketsChannelHandlerListener<T> listener,
  }) {
    listenersSubject.add(<IWebSocketsChannelHandlerListener<T>>[
      ...listeners,
      listener,
    ]);

    return CustomDisposable(() {
      listenersSubject.add(
        listeners.where((element) => element != listener).toList(),
      );
    });
  }

  @override
  List<IWebSocketsChannelHandlerListener<T>> get listeners =>
      listenersSubject.value;

  @override
  Stream<List<IWebSocketsChannelHandlerListener<T>>> get listenersStream =>
      listenersSubject.stream;
}
