import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/account/relationship/follow_update/unifedi_api_account_relationship_follow_update_model.dart';
import '../../../api/announcement/unifedi_api_announcement_model.dart';
import '../../../api/chat/unifedi_api_chat_model.dart';
import '../../../api/conversation/unifedi_api_conversation_model.dart';
import '../../../api/notification/unifedi_api_notification_model.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/web_sockets/channel/unifedi_api_web_sockets_channel_model.dart';
import '../../../api/web_sockets/event/unifedi_api_web_sockets_event_model.dart';
import '../../announcement/unifedi_api_announcement_model_mastodon_adapter.dart';
import '../../conversation/unifedi_api_conversation_model_mastodon_adapter.dart';
import '../../notification/unifedi_api_notification_model_mastodon_adapter.dart';
import '../../status/unifedi_api_status_model_mastodon_adapter.dart';
import '../channel/unifedi_api_web_sockets_channel_model_mastodon_adapter.dart';
import 'type/unifedi_api_web_sockets_event_type_sealed_mastodon_converter.dart';

part 'unifedi_api_web_sockets_event_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_web_sockets_event_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiWebSocketsEventMastodonAdapter
    with _$UnifediApiWebSocketsEventMastodonAdapter
    implements IUnifediApiWebSocketsEvent {
  const UnifediApiWebSocketsEventMastodonAdapter._();

  const factory UnifediApiWebSocketsEventMastodonAdapter(
    @HiveField(0) MastodonApiWebSocketsEvent value,
  ) = _UnifediApiWebSocketsEventMastodonAdapter;

  factory UnifediApiWebSocketsEventMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiWebSocketsEventMastodonAdapterFromJson(json);

  @override
  IUnifediApiWebSocketsChannel get channel =>
      UnifediApiWebSocketsChannelMastodonAdapter(value.channel);

  @override
  String get type =>
      value.typeAsMastodonApi.toUnifediApiWebSocketsEventType().stringValue;

  @override
  String? get id => value.id;

  @override
  IUnifediApiAnnouncement? get announcement =>
      value.announcement?.toUnifediApiAnnouncementMastodonAdapter();

  @override
  IUnifediApiChat? get chat => null;

  @override
  IUnifediApiConversation? get conversation =>
      value.conversation?.toUnifediApiConversationMastodonAdapter();

  @override
  IUnifediApiNotification? get notification =>
      value.notification?.toUnifediApiNotificationMastodonAdapter();

  @override
  IUnifediApiStatus? get status =>
      value.status?.toUnifediApiStatusMastodonAdapter();

  @override
  IUnifediApiAccountRelationshipFollowUpdate? get followUpdate => null;
}

extension MastodonApiWebSocketsEventUnifediExtension
    on IMastodonApiWebSocketsEvent {
  UnifediApiWebSocketsEventMastodonAdapter
      toUnifediApiWebSocketsEventMastodonAdapter() =>
          UnifediApiWebSocketsEventMastodonAdapter(
            toMastodonApiWebSocketsEvent(),
          );
}
