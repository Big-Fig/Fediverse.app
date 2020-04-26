import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_model.dart';
import 'package:fedi/refactored/websockets/websockets_channel_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaNotificationWebSocketsService extends DisposableOwner {
  static IPleromaNotificationWebSocketsService of(BuildContext context,
          {listen: true}) =>
      Provider.of(context, listen: listen);

  /// Returns events that are relevant to the authorized user,
  /// i.e. home timeline and notifications
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getUserChannel();

  /// Returns all direct events
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getDirectChannel();

  /// Returns all public events
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getPublicChannel(
      {@required bool local});

  /// Returns all public events for a particular hashtag
  /// local support mentioned in Mastodon docs but not implemented in Pleroma
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getHashtagChannel(
      {@required String hashtag, @required bool local});

  /// Return events for a list
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getListChannel(
      {@required String listId});
}
