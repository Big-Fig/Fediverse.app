import 'package:fedi/refactored/pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel.dart';
import 'package:fedi/refactored/pleroma/notifications/websockets/pleroma_notifications_websockets_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaNotificationsWebSocketsService extends DisposableOwner {
  static IPleromaNotificationsWebSocketsService of(BuildContext context,
          {listen: true}) =>
      Provider.of(context, listen: listen);

  /// Must be called when current client changed
  void onClientChanged();

  /// Returns events that are relevant to the authorized user,
  /// i.e. home timeline and notifications
  IPleromaNotificationsWebSocketsChannel getUserChannel();

  /// Returns all direct events
  IPleromaNotificationsWebSocketsChannel getDirectChannel();

  /// Returns all public events
  IPleromaNotificationsWebSocketsChannel getPublicChannel(
      {@required bool local});

  /// Returns all public events for a particular hashtag
  /// local support mentioned in Mastodon docs but not implemented in Pleroma
  IPleromaNotificationsWebSocketsChannel getHashtagChannel(
      {@required String hashtag, @required bool local});

  /// Return events for a list
  IPleromaNotificationsWebSocketsChannel getListChannel(
      {@required String listId});
}
