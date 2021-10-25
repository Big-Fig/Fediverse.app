import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/push/payload/unifedi_api_push_payload_model.dart';
import '../../notification/type/unifedi_api_notification_type_sealed_mastodon_converter.dart';

part 'unifedi_api_push_payload_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_push_payload_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushPayloadMastodonAdapter
    with _$UnifediApiPushPayloadMastodonAdapter
    implements IUnifediApiPushPayload {
  const UnifediApiPushPayloadMastodonAdapter._();
  const factory UnifediApiPushPayloadMastodonAdapter(
    @HiveField(0) MastodonApiPushPayload value,
  ) = _UnifediApiPushPayloadMastodonAdapter;

  @override
  String? get body => value.body;

  @override
  String? get icon => value.icon;

  @override
  String get notificationId => value.notificationId;

  @override
  String get notificationType => value.notificationTypeAsMastodonApi
      .toUnifediApiNotificationType()
      .stringValue;

  @override
  String? get title => value.title;
  factory UnifediApiPushPayloadMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushPayloadMastodonAdapterFromJson(json);
}

extension MastodonApiPushPayloadUnifediExtension on IMastodonApiPushPayload {
  UnifediApiPushPayloadMastodonAdapter
      toUnifediApiPushPayloadMastodonAdapter() =>
          UnifediApiPushPayloadMastodonAdapter(
            toMastodonApiPushPayload(),
          );
}

extension MastodonApiPushPayloadUnifediListExtension
    on List<IMastodonApiPushPayload> {
  List<UnifediApiPushPayloadMastodonAdapter>
      toUnifediApiPushPayloadMastodonAdapterList() => map(
            (item) => item.toUnifediApiPushPayloadMastodonAdapter(),
          ).toList();
}
