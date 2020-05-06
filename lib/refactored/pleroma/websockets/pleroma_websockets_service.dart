import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_model.dart';
import 'package:fedi/refactored/websockets/websockets_channel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaWebSocketsService extends DisposableOwner {
  static IPleromaWebSocketsService of(BuildContext context,
          {listen= true}) =>
      Provider.of(context, listen: listen);


  /// Returns events that are relevant to user with accountId
  IWebSocketsChannel<PleromaWebSocketsEvent> getMyAccountChannel(
      {@required bool notification});

  /// Returns events that are relevant to the authorized user,
  /// i.e. home timeline and notifications
  IWebSocketsChannel<PleromaWebSocketsEvent> getAccountChannel(
      {@required String accountId, @required bool notification});
  /// Returns all direct events
  // todo: why we need account id here?
  IWebSocketsChannel<PleromaWebSocketsEvent> getDirectChannel(
      {@required String accountId});

  /// Returns all public events
  IWebSocketsChannel<PleromaWebSocketsEvent> getPublicChannel(
      {@required bool local, @required bool onlyMedia});

  /// Returns all public events for a particular hashtag
  /// local support mentioned in Mastodon docs but not implemented in Pleroma
  IWebSocketsChannel<PleromaWebSocketsEvent> getHashtagChannel(
      {@required String hashtag, @required bool local});

  /// Return events for a list
  IWebSocketsChannel<PleromaWebSocketsEvent> getListChannel(
      {@required String listId});
}
