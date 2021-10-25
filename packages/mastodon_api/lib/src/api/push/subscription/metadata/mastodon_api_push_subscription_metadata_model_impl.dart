import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../keys/mastodon_api_push_subscription_keys_model_impl.dart';
import 'mastodon_api_push_subscription_metadata_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_push_subscription_metadata_model_impl.freezed.dart';

part 'mastodon_api_push_subscription_metadata_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiPushSubscriptionMetadata
    with _$MastodonApiPushSubscriptionMetadata
    implements IMastodonApiPushSubscriptionMetadata {
  const factory MastodonApiPushSubscriptionMetadata({
    /// Endpoint URL that is called when a notification event occurs.
    @HiveField(0) required String endpoint,
    @HiveField(1) required MastodonApiPushSubscriptionKeys keys,
  }) = _MastodonApiPushSubscribeRequestSubscription;

  factory MastodonApiPushSubscriptionMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPushSubscriptionMetadataFromJson(json);
}

extension IMastodonApiPushSubscriptionMetadataInterfaceExtension
    on IMastodonApiPushSubscriptionMetadata {
  MastodonApiPushSubscriptionMetadata toMastodonApiPushSubscriptionMetadata({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPushSubscriptionMetadata(
          endpoint: endpoint,
          keys: keys.toMastodonApiPushSubscriptionKeys(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
