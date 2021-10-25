import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'mastodon_api_push_payload_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_push_payload_model_impl.freezed.dart';

part 'mastodon_api_push_payload_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiPushPayload
    with _$MastodonApiPushPayload
    implements IMastodonApiPushPayload {
  const factory MastodonApiPushPayload({
    @HiveField(0)
    @JsonKey(name: 'notification_id')
        required String notificationId,
    @HiveField(1)
    @JsonKey(name: 'notification_type')
        required String notificationType,
    @HiveField(2) required String? title,
    @HiveField(3) required String? body,
    @HiveField(4) required String? icon,
  }) = _MastodonApiPushPayload;

  factory MastodonApiPushPayload.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPushPayloadFromJson(json);
}

extension IMastodonApiPushPayloadInterfaceExtension on IMastodonApiPushPayload {
  MastodonApiPushPayload toMastodonApiPushPayload({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPushPayload(
          notificationId: notificationId,
          notificationType: notificationType,
          title: title,
          body: body,
          icon: icon,
        ),
        forceNewObject: forceNewObject,
      );
}
