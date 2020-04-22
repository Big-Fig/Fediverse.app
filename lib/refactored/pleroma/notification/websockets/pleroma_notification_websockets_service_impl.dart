import 'package:fedi/refactored/pleroma/notification/websockets/channel/pleroma_notification_websockets_channel.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/channel/pleroma_notification_websockets_channel_impl.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_service.dart';
import 'package:flutter/widgets.dart';

class PleromaNotificationWebSocketsService
    extends IPleromaNotificationWebSocketsService {
  final String baseUrl;

  final String accessToken;

  PleromaNotificationWebSocketsService(
      {@required this.baseUrl, @required this.accessToken});

  final Map<PleromaNotificationWebSocketsChannelSettings,
      PleromaNotificationWebSocketsChannel> urlToChannel = Map();

  IPleromaNotificationWebSocketsChannel getOrCreateNewChannel(
      {@required PleromaNotificationWebSocketsChannelSettings settings}) {
    if (!urlToChannel.containsKey(settings)) {
      urlToChannel[settings] = createChannel(settings: settings);
    }

    return urlToChannel[settings];
  }

  IPleromaNotificationWebSocketsChannel createChannel(
          {@required PleromaNotificationWebSocketsChannelSettings settings}) =>
      PleromaNotificationWebSocketsChannel(settings: settings);

  @override
  IPleromaNotificationWebSocketsChannel getHashtagChannel(
          {@required String hashtag, @required bool local}) =>
      getOrCreateNewChannel(
          settings: PleromaNotificationWebSocketsChannelSettings(
              baseUrl: baseUrl,
              accessToken: accessToken,
              stream: local ? "hashtag:local" : "hashtag",
              additionalQueryArgs: {"tag": hashtag}));

  @override
  IPleromaNotificationWebSocketsChannel getListChannel(
          {@required String listId}) =>
      getOrCreateNewChannel(
          settings: PleromaNotificationWebSocketsChannelSettings(
              baseUrl: baseUrl,
              accessToken: accessToken,
              stream: "list",
              additionalQueryArgs: {"list": listId}));

  @override
  IPleromaNotificationWebSocketsChannel getPublicChannel(
          {@required bool local}) =>
      getOrCreateNewChannel(
          settings: PleromaNotificationWebSocketsChannelSettings(
              baseUrl: baseUrl,
              accessToken: accessToken,
              stream: local ? "public:local" : "public"));

  @override
  IPleromaNotificationWebSocketsChannel getUserChannel() =>
      getOrCreateNewChannel(
          settings: PleromaNotificationWebSocketsChannelSettings(
              baseUrl: baseUrl, accessToken: accessToken, stream: "user"));

  @override
  IPleromaNotificationWebSocketsChannel
      getDirectChannel() => getOrCreateNewChannel(
          settings: PleromaNotificationWebSocketsChannelSettings(
              baseUrl: baseUrl, accessToken: accessToken, stream: "direct"));

  @override
  void dispose() {
    super.dispose();

    urlToChannel.values.forEach((channel) {
      channel.dispose();
    });

    urlToChannel.clear();
  }
}
