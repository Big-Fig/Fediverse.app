import 'dart:async';

import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPleromaNotificationWebSocketsChannel {
  replaceBaseUrlAndAuth(
      {@required String baseUrl, @required String accessToken});

  PleromaNotificationWebSocketsChannelSettings get settings;

  StreamController<PleromaNotificationWebSocketsEvent>
      createEventsStreamController();

  Disposable listenEvents(
      Function(PleromaNotificationWebSocketsEvent event) callback);
}

class PleromaNotificationWebSocketsChannelSettings {
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

  PleromaNotificationWebSocketsChannelSettings(
      {@required this.baseUrl,
      @required this.accessToken,
      @required this.stream,
      this.additionalQueryArgs});

  @override
  String toString() {
    return 'PleromaNotificationWebSocketsChannelSettings{'
        'baseUrl: $baseUrl, accessToken: $accessToken,'
        ' stream: $stream, additionalQueryArgs: $additionalQueryArgs}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaNotificationWebSocketsChannelSettings &&
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
