import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/channel/pleroma_notification_websockets_channel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaNotificationWebSocketsService extends DisposableOwner {
  static IPleromaNotificationWebSocketsService of(BuildContext context,
          {listen: true}) =>
      Provider.of(context, listen: listen);

  /// Must be called when current client changed
  void onClientChanged();

  /// Returns events that are relevant to the authorized user,
  /// i.e. home timeline and notifications
  IPleromaNotificationWebSocketsChannel getUserChannel();

  /// Returns all direct events
  IPleromaNotificationWebSocketsChannel getDirectChannel();

  /// Returns all public events
  IPleromaNotificationWebSocketsChannel getPublicChannel(
      {@required bool local});

  /// Returns all public events for a particular hashtag
  /// local support mentioned in Mastodon docs but not implemented in Pleroma
  IPleromaNotificationWebSocketsChannel getHashtagChannel(
      {@required String hashtag, @required bool local});

  /// Return events for a list
  IPleromaNotificationWebSocketsChannel getListChannel(
      {@required String listId});
}
