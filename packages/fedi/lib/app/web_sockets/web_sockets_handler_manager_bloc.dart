import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsHandlerManagerBloc implements IDisposable {
  static IWebSocketsHandlerManagerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IWebSocketsHandlerManagerBloc>(context, listen: listen);

  IDisposable listenMyAccountChannel({
    required WebSocketsChannelHandlerType handlerType,
    required bool notification,
    required bool chat,
  });

  IDisposable listenConversationChannel({
    required WebSocketsChannelHandlerType handlerType,
  });

  IDisposable listenPleromaChatChannel({
    required WebSocketsChannelHandlerType handlerType,
  });

  IDisposable listenPublicChannel({
    required WebSocketsChannelHandlerType handlerType,
    required bool? onlyLocal,
    required bool? onlyMedia,
    required bool? onlyRemote,
    required String? onlyFromInstance,
  });

  IDisposable listenHashtagChannel({
    required WebSocketsChannelHandlerType handlerType,
    required String hashtag,
    required bool? local,
  });

  IDisposable listenListChannel({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
  });
}
