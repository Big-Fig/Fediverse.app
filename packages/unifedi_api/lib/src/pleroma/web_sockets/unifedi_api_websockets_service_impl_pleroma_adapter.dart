import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../api/feature/unifedi_api_feature_model.dart';
import '../../api/rest/unifedi_api_rest_service.dart';
import '../../api/web_sockets/event/unifedi_api_web_sockets_event_model.dart';
import '../../api/web_sockets/unifedi_api_web_sockets_service.dart';
import '../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../service/unifedi_api_service_pleroma_adapter.dart';
import 'event/unifedi_api_web_sockets_event_model_pleroma_adapter.dart';

class UnifediApiWebSocketsServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiWebSocketsService {
  final IPleromaApiWebSocketsService pleromaApiWebSocketsService;

  @override
  IWebSocketsService get webSocketsService =>
      pleromaApiWebSocketsService.webSocketsService;

  @override
  final IUnifediApiRestService restService;

  UnifediApiWebSocketsServicePleromaAdapter({
    required this.pleromaApiWebSocketsService,
    required this.restService,
  });

  @override
  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForAccountConversationEvents(
        handlerType: handlerType,
        accountId: accountId,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForAccountConversationEventsFeature =>
      pleromaApiWebSocketsService.listenForAccountConversationEventsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForAllConversationEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForAllMyAccountEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForAllMyAccountEventsFeature =>
      pleromaApiWebSocketsService.listenForAllMyAccountEventsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IDisposable listenForChatMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForChatMyAccountEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForChatMyAccountEventsFeature =>
      pleromaApiWebSocketsService.listenForChatMyAccountEventsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForCustomListEvents(
        handlerType: handlerType,
        listId: listId,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForCustomListEventsFeature =>
      pleromaApiWebSocketsService.listenForCustomListEventsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForHashtagEvents(
        handlerType: handlerType,
        localOnly: localOnly,
        tag: tag,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForHashtagEventsFeature =>
      pleromaApiWebSocketsService.listenForHashtagEventsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForNotificationMyAccountEvents(
        handlerType: handlerType,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForNotificationMyAccountFeature =>
      pleromaApiWebSocketsService.listenForNotificationMyAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool? remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
    required UnifediApiWebSocketsEventListener onEvent,
  }) =>
      pleromaApiWebSocketsService.listenForPublicEvents(
        handlerType: handlerType,
        localOnly: localOnly,
        remoteOnly: remoteOnly,
        mediaOnly: mediaOnly,
        onlyFromInstance: onlyFromInstance,
        onEvent: _mapEvent,
      );

  @override
  IUnifediApiFeature get listenForPublicEventsFeature =>
      pleromaApiWebSocketsService.listenForPublicEventsFeature
          .toUnifediApiFeaturePleromaAdapter();

  static UnifediApiWebSocketsEventPleromaAdapter _mapEvent(
    IPleromaApiWebSocketsEvent event,
  ) =>
      event
          .toPleromaApiWebSocketsEvent()
          .toUnifediApiWebSocketsEventPleromaAdapter();

  @override
  IUnifediApiFeature get serviceFeature =>
      pleromaApiWebSocketsService.serviceFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  UnifediApiTypeSupportedFeature
      get listenForPublicEventsOnlyFromInstanceArgFeature =>
          const UnifediApiTypeSupportedFeature();

  @override
  UnifediApiTypeSupportedFeature
      get listenForPublicEventsRemoteOnlyArgFeature =>
          const UnifediApiTypeSupportedFeature();
}
