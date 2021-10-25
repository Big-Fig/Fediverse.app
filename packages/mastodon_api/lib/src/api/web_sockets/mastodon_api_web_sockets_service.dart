import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/mastodon_api_access_model.dart';
import '../feature/mastodon_api_feature_model.dart';
import 'event/mastodon_api_web_sockets_event_model.dart';

abstract class IMastodonApiWebSocketsService
    implements IFediverseApiWebSocketsService<IMastodonApiAccess> {
  IMastodonApiFeature get serviceFeature;

  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool mediaOnly,
    required MastodonApiWebSocketsEventListener onEvent,
  });

  IMastodonApiFeature get listenForPublicEventsFeature;

  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsEventListener onEvent,
  });

  IMastodonApiFeature get listenForAccountConversationEventsFeature;

  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required MastodonApiWebSocketsEventListener onEvent,
  });

  IMastodonApiFeature get listenForAllMyAccountEventsFeature;

  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsEventListener onEvent,
  });

  IMastodonApiFeature get listenForNotificationMyAccountFeature;

  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsEventListener onEvent,
  });

  IMastodonApiFeature get listenForCustomListEventsFeature;

  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required MastodonApiWebSocketsEventListener onEvent,
  });

  IMastodonApiFeature get listenForHashtagEventsFeature;

  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required MastodonApiWebSocketsEventListener onEvent,
  });
}
