import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/mastodon_api_access_bloc.dart';
import '../access/mastodon_api_access_model.dart';
import '../feature/mastodon_api_feature_model.dart';
import '../feature/mastodon_api_feature_model_impl.dart';
import 'channel/mastodon_api_web_sockets_channel_model.dart';
import 'channel/mastodon_api_web_sockets_channel_model_impl.dart';
import 'event/mastodon_api_web_sockets_event_model.dart';
import 'event/mastodon_api_web_sockets_event_model_impl.dart';
import 'mastodon_api_web_sockets_service.dart';

class MastodonApiWebSocketsService
    extends FediverseApiWebSocketsService<IMastodonApiAccess>
    implements IMastodonApiWebSocketsService {
  static const streamingRelativeUrl = '/api/v1/streaming';

  static const querySegmentSeparator = ':';

  static const notificationQuerySegmentValue = 'notification';
  static const localQuerySegmentValue = 'local';
  static const mediaQuerySegmentValue = 'media';

  static const listQueryArg = 'list';
  static const tagQueryArg = 'tag';
  static const accountIdQueryArg = 'tag';
  static const streamQueryArg = 'stream';
  static const accessTokenQueryArg = 'access_token';

  MastodonApiWebSocketsService({
    required IMastodonApiAccessBloc accessBloc,
    required IWebSocketsService webSocketsService,
  }) : super(
          accessBloc: accessBloc,
          webSocketsService: webSocketsService,
        );

  IDisposable listenForEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsChannel channel,
    required MastodonApiWebSocketsEventListener onEvent,
  }) {
    var access = accessBloc.access;

    var webSocketsChannel = webSocketsService
        .getOrCreateWebSocketsChannel<MastodonApiWebSocketsEvent>(
      config: WebSocketsChannelConfig.compose(
        baseUrl: calculateBaseUrl(access),
        queryArgs: [
          createUserAccessTokenQueryArg(access),
          ...convertChannelToQueryArgs(channel),
        ],
      ),
      eventParser: (Map<String, dynamic> json) {
        var webSocketsRawEvent = MastodonApiWebSocketsRawEvent.fromJson(json);

        return MastodonApiWebSocketsEvent(
          type: webSocketsRawEvent.type,
          payload: webSocketsRawEvent.payload,
          channel: channel,
          id: webSocketsRawEvent.tryToParsePayloadAsId(),
          status: webSocketsRawEvent.tryToParsePayloadAsStatus(),
          notification: webSocketsRawEvent.tryToParsePayloadAsNotification(),
          announcement: webSocketsRawEvent.tryToParsePayloadAsAnnouncement(),
          conversation: webSocketsRawEvent.tryToParsePayloadAsConversation(),
        );
      },
    );

    var handlerBloc = WebSocketsChannelHandlerBloc<MastodonApiWebSocketsEvent>(
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

  static String calculateBaseUrl(IMastodonApiAccess access) {
    var urlDomain = access.urlDomain;
    var webSocketsScheme =
        FediverseApiWebSocketsService.calculateWebSocketsUrlScheme(access);

    return UrlPathHelper.join([
      '$webSocketsScheme://$urlDomain',
      streamingRelativeUrl,
    ]);
  }

  static UrlQueryArg createUserAccessTokenQueryArg(IMastodonApiAccess access) {
    var userAccessToken = access.userAccessToken?.accessToken;

    if (userAccessToken != null) {
      return UrlQueryArg(
        key: accessTokenQueryArg,
        value: userAccessToken,
      );
    } else {
      throw ArgumentError.notNull(userAccessToken);
    }
  }

  static List<UrlQueryArg> convertChannelToQueryArgs(
    IMastodonApiWebSocketsChannel channel,
  ) {
    var querySegments = convertChannelToQuerySegments(channel);

    var streamQueryArgValue = convertQuerySegmentsToQueryArg(querySegments);

    return [
      UrlQueryArg(
        key: streamQueryArg,
        value: streamQueryArgValue,
      ),
      ...createNonSegmentQueryArgs(channel),
    ];
  }

  static List<UrlQueryArg> createNonSegmentQueryArgs(
    IMastodonApiWebSocketsChannel channel,
  ) {
    var listIdOnly = channel.listIdOnly;
    var tag = channel.tag;

    return [
      if (listIdOnly != null)
        UrlQueryArg(
          key: listQueryArg,
          value: listIdOnly,
        ),
      if (tag != null)
        UrlQueryArg(
          key: tagQueryArg,
          value: tag,
        ),
    ];
  }

  static String convertQuerySegmentsToQueryArg(List<String> querySegments) =>
      querySegments.join(querySegmentSeparator);

  static List<String> convertChannelToQuerySegments(
    IMastodonApiWebSocketsChannel channel,
  ) =>
      [
        channel.type,
        if (channel.localOnly == true) localQuerySegmentValue,
        if (channel.mediaOnly == true) mediaQuerySegmentValue,
        if (channel.notificationOnly == true) notificationQuerySegmentValue,
      ];

  @override
  IDisposable listenForAccountConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.direct(
          fromAccountIdOnly: accountId,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForAllConversationEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.direct(
          fromAccountIdOnly: null,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForAllMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.user(
          notificationOnly: false,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForCustomListEvents({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.list(
          listIdOnly: listId,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForHashtagEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required String tag,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.hashtag(
          localOnly: localOnly,
          tag: tag,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForNotificationMyAccountEvents({
    required WebSocketsChannelHandlerType handlerType,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.user(
          notificationOnly: true,
        ),
        onEvent: onEvent,
      );

  @override
  IDisposable listenForPublicEvents({
    required WebSocketsChannelHandlerType handlerType,
    required bool localOnly,
    required bool mediaOnly,
    required MastodonApiWebSocketsEventListener onEvent,
  }) =>
      listenForEvents(
        handlerType: handlerType,
        channel: MastodonApiWebSocketsChannel.public(
          localOnly: localOnly,
          mediaOnly: mediaOnly,
        ),
        onEvent: onEvent,
      );

  @override
  IMastodonApiFeature get serviceFeature =>
      MastodonApiFeature.onlyUserRequirements;

  @override
  IMastodonApiFeature get listenForPublicEventsFeature =>
      MastodonApiFeature.onlyUserRequirements;

  @override
  IMastodonApiFeature get listenForAccountConversationEventsFeature =>
      MastodonApiFeature.onlyUserRequirements;

  @override
  IMastodonApiFeature get listenForAllMyAccountEventsFeature =>
      MastodonApiFeature.onlyUserRequirements;

  @override
  IMastodonApiFeature get listenForCustomListEventsFeature =>
      MastodonApiFeature.onlyUserRequirements;

  @override
  IMastodonApiFeature get listenForHashtagEventsFeature =>
      MastodonApiFeature.onlyUserRequirements;

  @override
  IMastodonApiFeature get listenForNotificationMyAccountFeature =>
      MastodonApiFeature.onlyUserRequirements;
}
