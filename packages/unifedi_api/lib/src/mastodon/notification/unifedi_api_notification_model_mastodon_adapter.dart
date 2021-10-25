import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/account/report/unifedi_api_account_report_model.dart';
import '../../api/account/unifedi_api_account_model.dart';
import '../../api/chat/message/unifedi_api_chat_message_model.dart';
import '../../api/notification/unifedi_api_notification_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../status/unifedi_api_status_model_mastodon_adapter.dart';
import 'type/unifedi_api_notification_type_sealed_mastodon_converter.dart';

part 'unifedi_api_notification_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_notification_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiNotificationMastodonAdapter
    with _$UnifediApiNotificationMastodonAdapter
    implements IUnifediApiNotification {
  const UnifediApiNotificationMastodonAdapter._();

  const factory UnifediApiNotificationMastodonAdapter(
    @HiveField(0) MastodonApiNotification value,
  ) = _UnifediApiNotificationMastodonAdapter;

  @override
  IUnifediApiAccount? get account =>
      value.account?.toUnifediApiAccountMastodonAdapter();

  @override
  IUnifediApiChatMessage? get chatMessage => null;

  @override
  DateTime get createdAt => value.createdAt;

  @override
  String? get emoji => null;

  @override
  String get id => value.id;

  @override
  bool? get isMuted => null;

  @override
  bool? get isSeen => null;

  @override
  IUnifediApiAccountReport? get report => null;

  @override
  IUnifediApiStatus? get status =>
      value.status?.toUnifediApiStatusMastodonAdapter();

  @override
  IUnifediApiAccount? get target => null;

  @override
  @override
  String get type =>
      value.typeAsMastodonApi.toUnifediApiNotificationType().stringValue;

  factory UnifediApiNotificationMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiNotificationMastodonAdapterFromJson(json);
}

extension MastodonApiNotificationUnifediExtension on IMastodonApiNotification {
  UnifediApiNotificationMastodonAdapter
      toUnifediApiNotificationMastodonAdapter() =>
          UnifediApiNotificationMastodonAdapter(
            toMastodonApiNotification(),
          );
}

extension MastodonApiNotificationUnifediListExtension
    on List<IMastodonApiNotification> {
  List<UnifediApiNotificationMastodonAdapter>
      toUnifediApiNotificationMastodonAdapterList() => map(
            (item) => item.toUnifediApiNotificationMastodonAdapter(),
          ).toList();
}
