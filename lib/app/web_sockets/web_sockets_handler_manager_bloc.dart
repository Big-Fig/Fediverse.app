import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsHandlerManagerBloc implements IDisposable {
  static IWebSocketsHandlerManagerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IWebSocketsHandlerManagerBloc>(context, listen: listen);

  IDisposable listenMyAccountChannel({
    required WebSocketsListenType listenType,
    required bool notification,
    required bool chat,
  });

  IDisposable listenAccountChannel({
    required WebSocketsListenType listenType,
    required String? accountId,
    required bool notification,
  });

  IDisposable listenConversationChannel({
    required WebSocketsListenType listenType,
  });

  IDisposable listenPleromaChatChannel({
    required WebSocketsListenType listenType,
  });

  IDisposable listenPublicChannel({
    required WebSocketsListenType listenType,
    required bool? onlyLocal,
    required bool? onlyMedia,
    required bool? onlyRemote,
    required String? onlyFromInstance,
  });

  IDisposable listenHashtagChannel({
    required WebSocketsListenType listenType,
    required String? hashtag,
    required bool? local,
  });

  IDisposable listenListChannel({
    required WebSocketsListenType listenType,
    required String? listId,
  });
}
