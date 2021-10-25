import 'dart:convert';

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';

import '../../account/relationship/follow_update/pleroma_api_account_relationship_follow_update_model.dart';
import '../../account/relationship/follow_update/pleroma_api_account_relationship_follow_update_model_impl.dart';
import '../../announcement/pleroma_api_announcement_model.dart';
import '../../announcement/pleroma_api_announcement_model_impl.dart';
import '../../chat/pleroma_api_chat_model.dart';
import '../../chat/pleroma_api_chat_model_impl.dart';
import '../../conversation/pleroma_api_conversation_model.dart';
import '../../conversation/pleroma_api_conversation_model_impl.dart';
import '../../notification/pleroma_api_notification_model.dart';
import '../../notification/pleroma_api_notification_model_impl.dart';
import '../../status/pleroma_api_status_model.dart';
import '../../status/pleroma_api_status_model_impl.dart';
import '../channel/pleroma_api_web_sockets_channel_model.dart';
import 'type/pleroma_api_web_sockets_event_type_sealed.dart';

final _logger = Logger('pleroma_api_web_sockets_event_model.dart');

typedef PleromaApiWebSocketsEventListener = void Function(
  IPleromaApiWebSocketsEvent event,
);
typedef PleromaApiWebSocketsEventPayloadParser<T> = T Function(
  dynamic json,
);

abstract class IPleromaApiWebSocketsRawEvent implements IWebSocketsEvent {
  String get type;

  String? get payload;
}

abstract class IPleromaApiWebSocketsEvent
    implements IPleromaApiWebSocketsRawEvent {
  IPleromaApiWebSocketsChannel get channel;

  IPleromaApiStatus? get status;

  IPleromaApiNotification? get notification;

  IPleromaApiAnnouncement? get announcement;

  IPleromaApiChat? get chat;

  IPleromaApiConversation? get conversation;

  IPleromaApiAccountRelationshipFollowUpdate? get followUpdate;

  String? get id;
}

extension IPleromaApiWebSocketsRawEventExtension
    on IPleromaApiWebSocketsRawEvent {
  PleromaApiWebSocketsEventType get typeAsPleromaApi =>
      PleromaApiWebSocketsEventType.fromStringValue(type);

  PleromaApiStatus? tryToParsePayloadAsStatus() => typeAsPleromaApi.maybeMap(
        update: (json) => payload?.parse(
          (json) => PleromaApiStatus.fromJson(json),
        ),
        orElse: () => null,
      );

  PleromaApiNotification? tryToParsePayloadAsNotification() =>
      typeAsPleromaApi.maybeMap(
        notification: (json) => payload?.parse(
          (json) => PleromaApiNotification.fromJson(json),
        ),
        orElse: () => null,
      );

  PleromaApiAnnouncement? tryToParsePayloadAsAnnouncement() =>
      typeAsPleromaApi.maybeMap(
        announcement: (json) => payload?.parse(
          (json) => PleromaApiAnnouncement.fromJson(json),
        ),
        orElse: () => null,
      );

  PleromaApiChat? tryToParsePayloadAsChat() => typeAsPleromaApi.maybeMap(
        pleromaChatUpdate: (json) => payload?.parse(
          (json) => PleromaApiChat.fromJson(json),
        ),
        orElse: () => null,
      );

  PleromaApiAccountRelationshipFollowUpdate?
      tryToParsePayloadAsFollowUpdate() => typeAsPleromaApi.maybeMap(
            pleromaFollowRelationshipsUpdate: (json) => payload?.parse(
              (json) =>
                  PleromaApiAccountRelationshipFollowUpdate.fromJson(json),
            ),
            orElse: () => null,
          );

  PleromaApiConversation? tryToParsePayloadAsConversation() =>
      typeAsPleromaApi.maybeMap(
        conversation: (json) => payload?.parse(
          (json) => PleromaApiConversation.fromJson(json),
        ),
        orElse: () => null,
      );

  String? tryToParsePayloadAsId() => typeAsPleromaApi.maybeMap(
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

extension IPleromaApiWebSocketsEventTypeExtension
    on IPleromaApiWebSocketsEvent {
  PleromaApiWebSocketsEventType get typeAsPleromaApi =>
      type.toPleromaApiWebSocketsEventType();
}
