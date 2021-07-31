import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/web_sockets/pleroma_api_web_sockets_model.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

abstract class IPleromaApiWebSocketsService extends DisposableOwner {
  /// Returns events that are relevant to user with accountId
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getMyAccountChannel({
    required bool notification,
    required bool chat,
  });

  /// Returns events that are relevant to the authorized user,
  /// i.e. home timeline and notifications
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getAccountChannel({
    required String accountId,
    required bool notification,
  });

  /// Returns all direct events
  // todo: why we need account id here?
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getDirectChannel({
    required String? accountId,
  });

  /// Returns all public events
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getPublicChannel({
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? onlyMedia,
    required String? onlyFromInstance,
  });

  /// Returns all public events for a particular hashtag
  /// local support mentioned in Mastodon docs but not implemented in Pleroma
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getHashtagChannel({
    required String hashtag,
    required bool? local,
  });

  /// Return events for a list
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getListChannel({
    required String listId,
  });
}
