import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/relationship/follow_update/unifedi_api_account_relationship_follow_update_model.dart';
import '../../../api/announcement/unifedi_api_announcement_model.dart';
import '../../../api/chat/unifedi_api_chat_model.dart';
import '../../../api/conversation/unifedi_api_conversation_model.dart';
import '../../../api/notification/unifedi_api_notification_model.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/web_sockets/channel/unifedi_api_web_sockets_channel_model.dart';
import '../../../api/web_sockets/event/unifedi_api_web_sockets_event_model.dart';
import '../../account/relationship/follow_update/unifedi_api_account_relationship_follow_update_model_pleroma_adapter.dart';
import '../../announcement/unifedi_api_announcement_model_pleroma_adapter.dart';
import '../../chat/unifedi_api_chat_model_pleroma_adapter.dart';
import '../../conversation/unifedi_api_conversation_model_pleroma_adapter.dart';
import '../../notification/unifedi_api_notification_model_pleroma_adapter.dart';
import '../../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../channel/unifedi_api_web_sockets_channel_model_pleroma_adapter.dart';
import 'type/unifedi_api_web_sockets_event_type_sealed_pleroma_converter.dart';

part 'unifedi_api_web_sockets_event_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_web_sockets_event_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiWebSocketsEventPleromaAdapter
    with _$UnifediApiWebSocketsEventPleromaAdapter
    implements IUnifediApiWebSocketsEvent {
  const UnifediApiWebSocketsEventPleromaAdapter._();
  const factory UnifediApiWebSocketsEventPleromaAdapter(
    @HiveField(0) PleromaApiWebSocketsEvent value,
  ) = _UnifediApiWebSocketsEventPleromaAdapter;

  @override
  IUnifediApiWebSocketsChannel get channel =>
      UnifediApiWebSocketsChannelPleromaAdapter(value.channel);

  @override
  String get type =>
      value.typeAsPleromaApi.toUnifediApiWebSocketsEventType().stringValue;

  @override
  String? get id => value.id;

  @override
  IUnifediApiAnnouncement? get announcement =>
      value.announcement?.toUnifediApiAnnouncementPleromaAdapter();

  @override
  IUnifediApiChat? get chat => value.chat?.toUnifediApiChatPleromaAdapter();

  @override
  IUnifediApiConversation? get conversation =>
      value.conversation?.toUnifediApiConversationPleromaAdapter();

  @override
  IUnifediApiNotification? get notification =>
      value.notification?.toUnifediApiNotificationPleromaAdapter();

  @override
  IUnifediApiStatus? get status =>
      value.status?.toUnifediApiStatusPleromaAdapter();

  @override
  IUnifediApiAccountRelationshipFollowUpdate? get followUpdate =>
      value.followUpdate
          ?.toUnifediApiAccountRelationshipFollowUpdatePleromaAdapter();
  factory UnifediApiWebSocketsEventPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiWebSocketsEventPleromaAdapterFromJson(json);
}

extension PleromaApiWebSocketsEventUnifediExtension
    on IPleromaApiWebSocketsEvent {
  UnifediApiWebSocketsEventPleromaAdapter
      toUnifediApiWebSocketsEventPleromaAdapter() =>
          UnifediApiWebSocketsEventPleromaAdapter(
            toPleromaApiWebSocketsEvent(),
          );
}
