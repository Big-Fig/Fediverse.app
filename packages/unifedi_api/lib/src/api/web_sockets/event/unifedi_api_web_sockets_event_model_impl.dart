import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../account/relationship/follow_update/unifedi_api_account_relationship_follow_update_model_impl.dart';
import '../../announcement/unifedi_api_announcement_model_impl.dart';
import '../../chat/unifedi_api_chat_model_impl.dart';
import '../../conversation/unifedi_api_conversation_model_impl.dart';
import '../../notification/unifedi_api_notification_model_impl.dart';
import '../../status/unifedi_api_status_model_impl.dart';
import '../../unifedi_api_model.dart';
import '../channel/unifedi_api_web_sockets_channel_model_impl.dart';
import 'unifedi_api_web_sockets_event_model.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_web_sockets_event_model_impl.freezed.dart';

part 'unifedi_api_web_sockets_event_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiWebSocketsEvent
    with _$UnifediApiWebSocketsEvent
    implements IUnifediApiWebSocketsEvent, IUnifediApiObject {
  const factory UnifediApiWebSocketsEvent({
    @JsonKey(name: 'event') @HiveField(0) required String type,
    @HiveField(2) required UnifediApiWebSocketsChannel channel,
    @HiveField(3) required UnifediApiStatus? status,
    @HiveField(4) required UnifediApiNotification? notification,
    @HiveField(5) required UnifediApiAnnouncement? announcement,
    @HiveField(6) required UnifediApiChat? chat,
    @HiveField(7) required UnifediApiConversation? conversation,
    @HiveField(8) required String? id,
    @HiveField(9)
        required UnifediApiAccountRelationshipFollowUpdate? followUpdate,
  }) = _UnifediApiWebSocketsEvent;

  factory UnifediApiWebSocketsEvent.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiWebSocketsEventFromJson(json);
}

extension IUnifediApiWebSocketsEventInterfaceExtension
    on IUnifediApiWebSocketsEvent {
  UnifediApiWebSocketsEvent toUnifediApiWebSocketsEvent({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiWebSocketsEvent(
          type: type,
          channel: channel.toUnifediApiWebSocketsChannel(
            forceNewObject: forceNewObject,
          ),
          status: status?.toUnifediApiStatus(
            forceNewObject: forceNewObject,
          ),
          notification: notification?.toUnifediApiNotification(
            forceNewObject: forceNewObject,
          ),
          announcement: announcement?.toUnifediApiAnnouncement(
            forceNewObject: forceNewObject,
          ),
          chat: chat?.toUnifediApiChat(),
          conversation: conversation?.toUnifediApiConversation(
            forceNewObject: forceNewObject,
          ),
          followUpdate:
              followUpdate?.toUnifediApiAccountRelationshipFollowUpdate(
            forceNewObject: forceNewObject,
          ),
          id: id,
        ),
        forceNewObject: forceNewObject,
      );
}
