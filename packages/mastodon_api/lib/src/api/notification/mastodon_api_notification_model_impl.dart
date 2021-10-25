import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/mastodon_api_account_model_impl.dart';
import '../status/mastodon_api_status_model_impl.dart';
import 'mastodon_api_notification_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_notification_model_impl.freezed.dart';

part 'mastodon_api_notification_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiNotification
    with _$MastodonApiNotification
    implements IMastodonApiNotification {
  const factory MastodonApiNotification({
    @HiveField(0) required MastodonApiAccount? account,
    @HiveField(2) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(3) required String id,
    @HiveField(4) required String type,
    @HiveField(5) required MastodonApiStatus? status,
  }) = _MastodonApiNotification;

  factory MastodonApiNotification.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiNotificationFromJson(json);
}

extension MastodonApiNotificationInterfaceExtension
    on IMastodonApiNotification {
  MastodonApiNotification toMastodonApiNotification({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiNotification(
          account: account?.toMastodonApiAccount(
            forceNewObject: forceNewObject,
          ),
          createdAt: createdAt,
          id: id,
          type: type,
          status: status?.toMastodonApiStatus(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiNotificationInterfaceListExtension
    on List<IMastodonApiNotification> {
  List<MastodonApiNotification> toMastodonApiNotificationList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiNotification item) => item.toMastodonApiNotification(),
        forceNewObject: forceNewObject,
      );
}
