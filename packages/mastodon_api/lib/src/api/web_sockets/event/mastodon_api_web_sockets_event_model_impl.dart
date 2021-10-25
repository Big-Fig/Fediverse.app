import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../announcement/mastodon_api_announcement_model_impl.dart';
import '../../conversation/mastodon_api_conversation_model_impl.dart';
import '../../mastodon_api_model.dart';
import '../../notification/mastodon_api_notification_model_impl.dart';
import '../../status/mastodon_api_status_model_impl.dart';
import '../channel/mastodon_api_web_sockets_channel_model_impl.dart';
import 'mastodon_api_web_sockets_event_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_web_sockets_event_model_impl.freezed.dart';

part 'mastodon_api_web_sockets_event_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiWebSocketsEvent
    with _$MastodonApiWebSocketsEvent
    implements IMastodonApiWebSocketsEvent, IMastodonApiObject {
  const factory MastodonApiWebSocketsEvent({
    @JsonKey(name: 'event') @HiveField(0) required String type,
    @JsonKey(name: 'payload') @HiveField(10) required String? payload,
    @HiveField(2) required MastodonApiWebSocketsChannel channel,
    @HiveField(3) required MastodonApiStatus? status,
    @HiveField(4) required MastodonApiNotification? notification,
    @HiveField(5) required MastodonApiAnnouncement? announcement,
    @HiveField(7) required MastodonApiConversation? conversation,
    @HiveField(8) required String? id,
  }) = _MastodonApiWebSocketsEvent;

  factory MastodonApiWebSocketsEvent.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiWebSocketsEventFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class MastodonApiWebSocketsRawEvent
    with _$MastodonApiWebSocketsRawEvent
    implements IMastodonApiWebSocketsRawEvent, IMastodonApiObject {
  const factory MastodonApiWebSocketsRawEvent({
    @JsonKey(name: 'event') @HiveField(0) required String type,
    @JsonKey(name: 'payload') @HiveField(10) required String? payload,
  }) = _MastodonApiWebSocketsRawEvent;

  factory MastodonApiWebSocketsRawEvent.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiWebSocketsRawEventFromJson(json);
}

extension IMastodonApiWebSocketsEventInterfaceExtension
    on IMastodonApiWebSocketsEvent {
  MastodonApiWebSocketsEvent toMastodonApiWebSocketsEvent({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiWebSocketsEvent(
          type: type,
          payload: payload,
          id: id,
          channel: channel.toMastodonApiWebSocketsChannel(),
          status: status?.toMastodonApiStatus(),
          notification: notification?.toMastodonApiNotification(),
          announcement: announcement?.toMastodonApiAnnouncement(),
          conversation: conversation?.toMastodonApiConversation(),
        ),
        forceNewObject: forceNewObject,
      );
}
