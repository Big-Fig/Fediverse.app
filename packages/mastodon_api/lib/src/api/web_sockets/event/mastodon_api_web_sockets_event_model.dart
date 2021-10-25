import 'dart:convert';

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';

import '../../announcement/mastodon_api_announcement_model.dart';
import '../../announcement/mastodon_api_announcement_model_impl.dart';
import '../../conversation/mastodon_api_conversation_model.dart';
import '../../conversation/mastodon_api_conversation_model_impl.dart';
import '../../notification/mastodon_api_notification_model.dart';
import '../../notification/mastodon_api_notification_model_impl.dart';
import '../../status/mastodon_api_status_model.dart';
import '../../status/mastodon_api_status_model_impl.dart';
import '../channel/mastodon_api_web_sockets_channel_model.dart';
import 'type/mastodon_api_web_sockets_event_type_sealed.dart';

final _logger = Logger('mastodon_api_web_sockets_event_model.dart');

typedef MastodonApiWebSocketsEventListener = void Function(
  IMastodonApiWebSocketsEvent event,
);
typedef MastodonApiWebSocketsEventPayloadParser<T> = T Function(
  dynamic json,
);

abstract class IMastodonApiWebSocketsRawEvent implements IWebSocketsEvent {
  String get type;

  String? get payload;
}

abstract class IMastodonApiWebSocketsEvent
    implements IMastodonApiWebSocketsRawEvent {
  IMastodonApiWebSocketsChannel get channel;

  IMastodonApiStatus? get status;

  IMastodonApiNotification? get notification;

  IMastodonApiAnnouncement? get announcement;

  IMastodonApiConversation? get conversation;

  String? get id;
}

extension IMastodonApiWebSocketsRawEventExtension
    on IMastodonApiWebSocketsRawEvent {
  MastodonApiWebSocketsEventType get typeAsMastodonApi =>
      MastodonApiWebSocketsEventType.fromStringValue(type);

  MastodonApiStatus? tryToParsePayloadAsStatus() => typeAsMastodonApi.maybeMap(
        update: (json) => payload?.parse(
          (json) => MastodonApiStatus.fromJson(json),
        ),
        orElse: () => null,
      );

  MastodonApiNotification? tryToParsePayloadAsNotification() =>
      typeAsMastodonApi.maybeMap(
        notification: (json) => payload?.parse(
          (json) => MastodonApiNotification.fromJson(json),
        ),
        orElse: () => null,
      );

  MastodonApiAnnouncement? tryToParsePayloadAsAnnouncement() =>
      typeAsMastodonApi.maybeMap(
        announcement: (json) => payload?.parse(
          (json) => MastodonApiAnnouncement.fromJson(json),
        ),
        orElse: () => null,
      );

  MastodonApiConversation? tryToParsePayloadAsConversation() =>
      typeAsMastodonApi.maybeMap(
        conversation: (json) => payload?.parse(
          (json) => MastodonApiConversation.fromJson(json),
        ),
        orElse: () => null,
      );

  String? tryToParsePayloadAsId() => typeAsMastodonApi.maybeMap(
        delete: (json) => payload,
        orElse: () => null,
      );
}

extension ParsePayloadExtension on String {
  T? parse<T>(T Function(Map<String, dynamic> json) parser) {
    try {
      return parser(jsonDecode(this) as Map<String, dynamic>);
    } on Exception catch (e, stackTrace) {
      _logger.warning(
        () => 'parse error on "$this"',
        e,
        stackTrace,
      );

      return null;
    }
  }
}

extension IMastodonApiWebSocketsEventTypeExtension
    on IMastodonApiWebSocketsEvent {
  MastodonApiWebSocketsEventType get typeAsMastodonApi =>
      type.toMastodonApiWebSocketsEventType();
}
