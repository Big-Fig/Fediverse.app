import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/push/subscription/keys/unifedi_api_push_subscription_keys_model.dart';
import '../../../../api/push/subscription/metadata/unifedi_api_push_subscription_metadata_model.dart';
import '../keys/unifedi_api_push_subscription_keys_model_mastodon_adapter.dart';

part 'unifedi_api_push_subscription_metadata_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_push_subscription_metadata_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionMetadataMastodonAdapter
    with _$UnifediApiPushSubscriptionMetadataMastodonAdapter
    implements IUnifediApiPushSubscriptionMetadata {
  const UnifediApiPushSubscriptionMetadataMastodonAdapter._();
  const factory UnifediApiPushSubscriptionMetadataMastodonAdapter(
    @HiveField(0) MastodonApiPushSubscriptionMetadata value,
  ) = _UnifediApiPushSubscriptionMetadataMastodonAdapter;

  @override
  String? get endpoint => value.endpoint;

  @override
  IUnifediApiPushSubscriptionKeys? get keys =>
      value.keys.toUnifediApiPushSubscriptionKeysMastodonAdapter();
  factory UnifediApiPushSubscriptionMetadataMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionMetadataMastodonAdapterFromJson(json);
}

extension UnifediApiPushSubscriptionMetadataMastodonExtension
    on IUnifediApiPushSubscriptionMetadata {
  MastodonApiPushSubscriptionMetadata toMastodonApiPushSubscriptionMetadata() =>
      MastodonApiPushSubscriptionMetadata(
        // ignore: avoid-non-null-assertion
        endpoint: endpoint!,
        // ignore: avoid-non-null-assertion
        keys: keys!.toMastodonApiPushSubscriptionKeys(),
      );
}

extension MastodonApiPushSubscriptionMetadataUnifediExtension
    on IMastodonApiPushSubscriptionMetadata {
  UnifediApiPushSubscriptionMetadataMastodonAdapter
      toUnifediApiPushSubscriptionMetadataMastodonAdapter() =>
          UnifediApiPushSubscriptionMetadataMastodonAdapter(
            toMastodonApiPushSubscriptionMetadata(),
          );
}

extension MastodonApiPushSubscriptionMetadataUnifediListExtension
    on List<IMastodonApiPushSubscriptionMetadata> {
  List<UnifediApiPushSubscriptionMetadataMastodonAdapter>
      toUnifediApiPushSubscriptionMetadataMastodonAdapterList() => map(
            (item) =>
                item.toUnifediApiPushSubscriptionMetadataMastodonAdapter(),
          ).toList();
}
