import 'dart:async';

import 'package:fedi/refactored/pleroma/notifications/websockets/pleroma_notifications_websockets_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

abstract class IPleromaNotificationsWebSocketsChannel  {
  replaceBaseUrlAndAuth(
      {@required String baseUrl, @required String accessToken});
  PleromaNotificationsWebSocketsChannelSettings get settings;

  StreamController<PleromaNotificationsWebSocketsEvent> createEventsStreamController();
  Disposable listenEvents(Function
      (PleromaNotificationsWebSocketsEvent event) callback);
}

class PleromaNotificationsWebSocketsChannelSettings {
  final String baseUrl;
  final String accessToken;
  /// Stream name:
  /// user
  /// public
  /// public:local
  /// hashtag
  /// hashtag:local
  /// list
  /// direct
  final String stream;
  final Map<String, String> additionalQueryArgs;

  PleromaNotificationsWebSocketsChannelSettings(
      {@required this.baseUrl,
      @required this.accessToken,
      @required this.stream,
      this.additionalQueryArgs});

  @override
  String toString() {
    return 'PleromaNotificationsWebSocketsChannelSettings{'
        'baseUrl: $baseUrl, accessToken: $accessToken,'
        ' stream: $stream, additionalQueryArgs: $additionalQueryArgs}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PleromaNotificationsWebSocketsChannelSettings &&
              runtimeType == other.runtimeType &&
              baseUrl == other.baseUrl &&
              accessToken == other.accessToken &&
              stream == other.stream &&
              additionalQueryArgs == other.additionalQueryArgs;

  @override
  int get hashCode =>
      baseUrl.hashCode ^
      accessToken.hashCode ^
      stream.hashCode ^
      additionalQueryArgs.hashCode;




}
