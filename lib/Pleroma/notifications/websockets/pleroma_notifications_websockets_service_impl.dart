import 'dart:async';

import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel.dart';
import 'package:fedi/Pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel_impl.dart';
import 'package:fedi/Pleroma/notifications/websockets/pleroma_notifications_websockets_model.dart';
import 'package:fedi/Pleroma/notifications/websockets/pleroma_notifications_websockets_service.dart';
import 'package:flutter/widgets.dart';

class PleromaNotificationsWebSocketsService
    extends IPleromaNotificationsWebSocketsService {
  // TODO: should be refactored as constructor argument
  // after current instance swap refactoring
  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  // TODO: should be refactored as constructor argument
  // after current instance swap refactoring
  String get accessToken => CurrentInstance.instance.currentClient.accessToken;

  final Map<PleromaNotificationsWebSocketsChannelSettings,
      PleromaNotificationsWebSocketsChannel> urlToChannel = Map();

  IPleromaNotificationsWebSocketsChannel getOrCreateNewChannel(
      {@required PleromaNotificationsWebSocketsChannelSettings settings}) {
    if (!urlToChannel.containsKey(settings)) {
      urlToChannel[settings] = createChannel(settings: settings);
    }

    return urlToChannel[settings];
  }

  IPleromaNotificationsWebSocketsChannel createChannel(
          {@required PleromaNotificationsWebSocketsChannelSettings settings}) =>
      PleromaNotificationsWebSocketsChannel(settings: settings);

  @override
  IPleromaNotificationsWebSocketsChannel getHashtagChannel(
          {@required String hashtag, @required bool local}) =>
      getOrCreateNewChannel(
          settings: PleromaNotificationsWebSocketsChannelSettings(
              baseUrl: baseUrl,
              accessToken: accessToken,
              stream: local ? "hashtag:local" : "hashtag",
              additionalQueryArgs: {"tag": hashtag}));

  @override
  IPleromaNotificationsWebSocketsChannel getListChannel(
          {@required String listId}) =>
      getOrCreateNewChannel(
          settings: PleromaNotificationsWebSocketsChannelSettings(
              baseUrl: baseUrl,
              accessToken: accessToken,
              stream: "list",
              additionalQueryArgs: {"list": listId}));

  @override
  IPleromaNotificationsWebSocketsChannel getPublicChannel(
          {@required bool local}) =>
      getOrCreateNewChannel(
              settings: PleromaNotificationsWebSocketsChannelSettings(
                  baseUrl: baseUrl,
                  accessToken: accessToken,
                  stream: local ? "public:local" : "public"));

  @override
  IPleromaNotificationsWebSocketsChannel getUserChannel() =>
      getOrCreateNewChannel(
              settings: PleromaNotificationsWebSocketsChannelSettings(
                  baseUrl: baseUrl, accessToken: accessToken, stream: "user"));

  @override
  IPleromaNotificationsWebSocketsChannel getDirectChannel() =>
      getOrCreateNewChannel(
              settings: PleromaNotificationsWebSocketsChannelSettings(
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
