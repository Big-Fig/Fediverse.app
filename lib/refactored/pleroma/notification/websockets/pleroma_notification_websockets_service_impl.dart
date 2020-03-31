import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/channel/pleroma_notification_websockets_channel.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/channel/pleroma_notification_websockets_channel_impl.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_service.dart';
import 'package:flutter/widgets.dart';

class PleromaNotificationWebSocketsService
    extends IPleromaNotificationWebSocketsService {
  // TODO: should be refactored as constructor argument
  // after current instance swap refactoring
  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  // TODO: should be refactored as constructor argument
  // after current instance swap refactoring
  String get accessToken => CurrentInstance.instance.currentClient.accessToken;

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

  /// Should be called after client changes CurrentInstance.instance.currentClient
  @override
  void onClientChanged() {
    // TODO: should be removed after current instance swap refactoring
    urlToChannel.values.forEach((channel) {
      channel.replaceBaseUrlAndAuth(baseUrl: baseUrl, accessToken: accessToken);
    });
  }
}
