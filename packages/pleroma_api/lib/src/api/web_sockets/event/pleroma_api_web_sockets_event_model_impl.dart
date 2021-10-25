import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../account/relationship/follow_update/pleroma_api_account_relationship_follow_update_model_impl.dart';
import '../../announcement/pleroma_api_announcement_model_impl.dart';
import '../../chat/pleroma_api_chat_model_impl.dart';
import '../../conversation/pleroma_api_conversation_model_impl.dart';
import '../../notification/pleroma_api_notification_model_impl.dart';
import '../../pleroma_api_model.dart';
import '../../status/pleroma_api_status_model_impl.dart';
import '../channel/pleroma_api_web_sockets_channel_model_impl.dart';
import 'pleroma_api_web_sockets_event_model.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_web_sockets_event_model_impl.freezed.dart';

part 'pleroma_api_web_sockets_event_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiWebSocketsEvent
    with _$PleromaApiWebSocketsEvent
    implements IPleromaApiWebSocketsEvent, IPleromaApiObject {
  const factory PleromaApiWebSocketsEvent({
    @JsonKey(name: 'event') @HiveField(0) required String type,
    @HiveField(2) required PleromaApiWebSocketsChannel channel,
    @HiveField(3) required PleromaApiStatus? status,
    @HiveField(4) required PleromaApiNotification? notification,
    @HiveField(5) required PleromaApiAnnouncement? announcement,
    @HiveField(6) required PleromaApiChat? chat,
    @HiveField(7) required PleromaApiConversation? conversation,
    @HiveField(8) required String? id,
    @HiveField(9)
        required PleromaApiAccountRelationshipFollowUpdate? followUpdate,
    @HiveField(10) required String? payload,
  }) = _PleromaApiWebSocketsEvent;

  factory PleromaApiWebSocketsEvent.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiWebSocketsEventFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiWebSocketsRawEvent
    with _$PleromaApiWebSocketsRawEvent
    implements IPleromaApiWebSocketsRawEvent, IPleromaApiObject {
  const factory PleromaApiWebSocketsRawEvent({
    @JsonKey(name: 'event') @HiveField(0) required String type,
    @JsonKey(name: 'payload') @HiveField(10) required String? payload,
  }) = _PleromaApiWebSocketsRawEvent;

  factory PleromaApiWebSocketsRawEvent.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiWebSocketsRawEventFromJson(json);
}

extension IPleromaApiWebSocketsEventInterfaceExtension
    on IPleromaApiWebSocketsEvent {
  PleromaApiWebSocketsEvent toPleromaApiWebSocketsEvent({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiWebSocketsEvent(
          type: type,
          payload: payload,
          channel: channel.toPleromaApiWebSocketsChannel(
            forceNewObject: forceNewObject,
          ),
          status: status?.toPleromaApiStatus(
            forceNewObject: forceNewObject,
          ),
          notification: notification?.toPleromaApiNotification(
            forceNewObject: forceNewObject,
          ),
          announcement: announcement?.toPleromaApiAnnouncement(
            forceNewObject: forceNewObject,
          ),
          chat: chat?.toPleromaApiChat(),
          conversation: conversation?.toPleromaApiConversation(
            forceNewObject: forceNewObject,
          ),
          followUpdate:
              followUpdate?.toPleromaApiAccountRelationshipFollowUpdate(
            forceNewObject: forceNewObject,
          ),
          id: id,
        ),
        forceNewObject: forceNewObject,
      );
}
