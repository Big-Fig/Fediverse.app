import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../api/feature/unifedi_api_feature_model.dart';
import '../../api/rest/unifedi_api_rest_service.dart';
import '../../api/web_sockets/event/unifedi_api_web_sockets_event_model.dart';
import '../../api/web_sockets/unifedi_api_web_sockets_service.dart';
import '../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../service/unifedi_api_service_mastodon_adapter.dart';
import 'event/unifedi_api_web_sockets_event_model_mastodon_adapter.dart';

class UnifediApiWebSocketsServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiWebSocketsService {
  final IMastodonApiWebSocketsService mastodonApiWebSocketsService;

  @override
  IWebSocketsService get webSocketsService =>
      mastodonApiWebSocketsService.webSocketsService;

  @override
  final IUnifediApiRestService restService;

  UnifediApiWebSocketsServiceMastodonAdapter({
    required this.mastodonApiWebSocketsService,
    required this.restService,
  });

  @override
  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      mastodonApiWebSocketsService.listenForAccountConversationEvents(
        handlerType: handlerType,
        accountId: accountId,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForAccountConversationEventsFeature =>
      mastodonApiWebSocketsService.listenForAccountConversationEventsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      mastodonApiWebSocketsService.listenForAllConversationEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      mastodonApiWebSocketsService.listenForAllMyAccountEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForAllMyAccountEventsFeature =>
      mastodonApiWebSocketsService.listenForAllMyAccountEventsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IDisposable listenForChatMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: listenForChatMyAccountEventsFeature,
      );

  @override
  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      mastodonApiWebSocketsService.listenForCustomListEvents(
        handlerType: handlerType,
        listId: listId,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForCustomListEventsFeature =>
      mastodonApiWebSocketsService.listenForCustomListEventsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      mastodonApiWebSocketsService.listenForHashtagEvents(
        handlerType: handlerType,
        localOnly: localOnly,
        tag: tag,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForHashtagEventsFeature =>
      mastodonApiWebSocketsService.listenForHashtagEventsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      mastodonApiWebSocketsService.listenForNotificationMyAccountEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForNotificationMyAccountFeature =>
      mastodonApiWebSocketsService.listenForNotificationMyAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool? remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
    required UnifediApiWebSocketsEventListener onEvent,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: remoteOnly,
      feature: listenForPublicEventsRemoteOnlyArgFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: onlyFromInstance,
      feature: listenForPublicEventsOnlyFromInstanceArgFeature,
    );

    return mastodonApiWebSocketsService.listenForPublicEvents(
      handlerType: handlerType,
      localOnly: localOnly,
      mediaOnly: mediaOnly,
      onEvent: _mapEvent,
    );
  }

  @override
  IUnifediApiFeature get listenForPublicEventsFeature =>
      mastodonApiWebSocketsService.listenForPublicEventsFeature
          .toUnifediApiFeatureMastodonAdapter();

  static UnifediApiWebSocketsEventMastodonAdapter _mapEvent(
    IMastodonApiWebSocketsEvent event,
  ) =>
      event
          .toMastodonApiWebSocketsEvent()
          .toUnifediApiWebSocketsEventMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature get listenForChatMyAccountEventsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'listenForChatMyAccountEvents',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get listenForPublicEventsOnlyFromInstanceArgFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'listenForPublicEventsOnlyFromInstance',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get listenForPublicEventsRemoteOnlyArgFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'listenForPublicEventsRemoteOnly',
          );

  @override
  IUnifediApiFeature get serviceFeature =>
      mastodonApiWebSocketsService.serviceFeature
          .toUnifediApiFeatureMastodonAdapter();
}
