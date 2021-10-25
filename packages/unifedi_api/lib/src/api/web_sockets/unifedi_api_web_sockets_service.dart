import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/unifedi_api_access_model.dart';
import '../feature/unifedi_api_feature_model.dart';
import '../unifedi_api_service.dart';
import 'event/unifedi_api_web_sockets_event_model.dart';

abstract class IUnifediApiWebSocketsService
    implements
        IUnifediApiService,
        IFediverseApiWebSocketsService<IUnifediApiAccess> {
  IUnifediApiFeature get serviceFeature;

  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool? remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForPublicEventsFeature;

  IUnifediApiFeature get listenForPublicEventsRemoteOnlyArgFeature;

  IUnifediApiFeature get listenForPublicEventsOnlyFromInstanceArgFeature;

  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForAccountConversationEventsFeature;

  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForAllMyAccountEventsFeature;

  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForNotificationMyAccountFeature;

  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForChatMyAccountEventsFeature;

  IDisposable listenForChatMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForCustomListEventsFeature;

  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required UnifediApiWebSocketsEventListener onEvent,
  });

  IUnifediApiFeature get listenForHashtagEventsFeature;

  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required UnifediApiWebSocketsEventListener onEvent,
  });
}
