import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/pleroma_api_access_model.dart';
import '../feature/pleroma_api_feature_model.dart';
import 'event/pleroma_api_web_sockets_event_model.dart';

abstract class IPleromaApiWebSocketsService
    implements IFediverseApiWebSocketsService<IPleromaApiAccess> {
  IPleromaApiFeature get serviceFeature;

  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool? remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForPublicEventsFeature;

  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForAccountConversationEventsFeature;

  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForAllMyAccountEventsFeature;

  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForNotificationMyAccountFeature;

  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForChatMyAccountEventsFeature;

  IDisposable listenForChatMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForCustomListEventsFeature;

  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required PleromaApiWebSocketsEventListener onEvent,
  });

  IPleromaApiFeature get listenForHashtagEventsFeature;

  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required PleromaApiWebSocketsEventListener onEvent,
  });
}
