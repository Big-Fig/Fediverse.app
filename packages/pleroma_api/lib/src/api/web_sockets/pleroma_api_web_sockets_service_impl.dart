import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../access/pleroma_api_access_bloc.dart';
import '../access/pleroma_api_access_model.dart';
import '../feature/pleroma_api_feature_model.dart';
import '../feature/pleroma_api_feature_model_impl.dart';
import 'channel/pleroma_api_web_sockets_channel_model.dart';
import 'channel/pleroma_api_web_sockets_channel_model_impl.dart';
import 'event/pleroma_api_web_sockets_event_model.dart';
import 'event/pleroma_api_web_sockets_event_model_impl.dart';
import 'pleroma_api_web_sockets_service.dart';

class PleromaApiWebSocketsService
    extends FediverseApiWebSocketsService<IPleromaApiAccess>
    implements IPleromaApiWebSocketsService {
  static const chatQuerySegmentValue = 'chat';
  static const remoteQuerySegmentValue = 'remote';

  static const instanceQueryArg = 'instance';

  final MastodonApiWebSocketsService mastodonApiWebSocketsService;

  PleromaApiWebSocketsService({
    required IPleromaApiAccessBloc accessBloc,
    required IWebSocketsService webSocketsService,
  })  : mastodonApiWebSocketsService = MastodonApiWebSocketsService(
          accessBloc: accessBloc.mastodonApiAccessBloc,
          webSocketsService: webSocketsService,
        ),
        super(
          accessBloc: accessBloc,
          webSocketsService: webSocketsService,
        ) {
    mastodonApiWebSocketsService.disposeWith(this);
  }

  IDisposable listenForEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsChannel channel,
    required PleromaApiWebSocketsEventListener onEvent,
  }) {
    var access = accessBloc.access;

    var webSocketsChannel = webSocketsService
        .getOrCreateWebSocketsChannel<PleromaApiWebSocketsEvent>(
      config: WebSocketsChannelConfig.compose(
        baseUrl: MastodonApiWebSocketsService.calculateBaseUrl(access),
        queryArgs: [
          MastodonApiWebSocketsService.createUserAccessTokenQueryArg(access),
          ...convertChannelToQueryArgs(channel),
        ],
      ),
      eventParser: (Map<String, dynamic> json) {
        var webSocketsRawEvent = PleromaApiWebSocketsRawEvent.fromJson(json);

        return PleromaApiWebSocketsEvent(
          id: webSocketsRawEvent.tryToParsePayloadAsId(),
          followUpdate: webSocketsRawEvent.tryToParsePayloadAsFollowUpdate(),
          type: webSocketsRawEvent.type,
          payload: webSocketsRawEvent.payload,
          channel: channel,
          status: webSocketsRawEvent.tryToParsePayloadAsStatus(),
          notification: webSocketsRawEvent.tryToParsePayloadAsNotification(),
          announcement: webSocketsRawEvent.tryToParsePayloadAsAnnouncement(),
          chat: webSocketsRawEvent.tryToParsePayloadAsChat(),
          conversation: webSocketsRawEvent.tryToParsePayloadAsConversation(),
        );
      },
    );

    var handlerBloc = WebSocketsChannelHandlerBloc<PleromaApiWebSocketsEvent>(
      handlerType: handlerType,
      channelBloc: webSocketsChannel,
    );
    handlerBloc
        .listenForEvents(
          listener: WebSocketsChannelHandlerListener(
            onEventAction: onEvent,
          ),
        )
        .disposeWith(handlerBloc);

    return handlerBloc;
  }

  static List<UrlQueryArg> convertChannelToQueryArgs(
    IPleromaApiWebSocketsChannel channel,
  ) {
    var querySegments = convertChannelToQuerySegments(channel);

    var streamQueryArgValue =
        MastodonApiWebSocketsService.convertQuerySegmentsToQueryArg(
      querySegments,
    );

    return [
      UrlQueryArg(
        key: MastodonApiWebSocketsService.streamQueryArg,
        value: streamQueryArgValue,
      ),
      ...createNonSegmentQueryArgs(channel),
    ];
  }

  static List<String> convertChannelToQuerySegments(
    IPleromaApiWebSocketsChannel channel,
  ) =>
      [
        ...MastodonApiWebSocketsService.convertChannelToQuerySegments(channel),
        if (channel.remoteOnly == true) remoteQuerySegmentValue,
        if (channel.chatOnly == true) chatQuerySegmentValue,
      ];

  static List<UrlQueryArg> createNonSegmentQueryArgs(
    IPleromaApiWebSocketsChannel channel,
  ) {
    var onlyFromInstance = channel.onlyFromInstance;

    return [
      ...MastodonApiWebSocketsService.createNonSegmentQueryArgs(channel),
      if (onlyFromInstance != null)
        UrlQueryArg(
          key: instanceQueryArg,
          value: onlyFromInstance,
        ),
    ];
  }

  @override
  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.direct(
          fromAccountIdOnly: accountId,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.direct(
          fromAccountIdOnly: null,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.user(
          chatOnly: false,
          notificationOnly: false,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForChatMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.user(
          chatOnly: true,
          notificationOnly: false,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.list(
          listIdOnly: listId,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.hashtag(
          localOnly: localOnly,
          tag: tag,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.user(
          chatOnly: false,
          notificationOnly: true,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool? remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
    required PleromaApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: PleromaApiWebSocketsChannel.public(
          localOnly: localOnly,
          remoteOnly: remoteOnly,
          mediaOnly: mediaOnly,
          onlyFromInstance: onlyFromInstance,
        ),
        onEvent: onEvent,
      );

  @override
  IPleromaApiFeature get serviceFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.serviceFeature,
      );

  @override
  IPleromaApiFeature get listenForPublicEventsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.listenForPublicEventsFeature,
      );

  @override
  IPleromaApiFeature get listenForAccountConversationEventsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.listenForAccountConversationEventsFeature,
      );

  @override
  IPleromaApiFeature get listenForAllMyAccountEventsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.listenForAllMyAccountEventsFeature,
      );

  @override
  IPleromaApiFeature get listenForChatMyAccountEventsFeature =>
      PleromaApiFeature.onlyUserRequirements(null);

  @override
  IPleromaApiFeature get listenForCustomListEventsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.listenForCustomListEventsFeature,
      );

  @override
  IPleromaApiFeature get listenForHashtagEventsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.listenForHashtagEventsFeature,
      );

  @override
  IPleromaApiFeature get listenForNotificationMyAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiWebSocketsService.listenForNotificationMyAccountFeature,
      );
}
