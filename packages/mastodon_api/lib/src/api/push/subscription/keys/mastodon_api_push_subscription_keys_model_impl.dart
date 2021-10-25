import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_push_subscription_keys_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_push_subscription_keys_model_impl.freezed.dart';

part 'mastodon_api_push_subscription_keys_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiPushSubscriptionKeys
    with _$MastodonApiPushSubscriptionKeys
    implements IMastodonApiPushSubscriptionKeys {
  const factory MastodonApiPushSubscriptionKeys({
    /// User agent public key.
    /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
    @HiveField(0) required String p256dh,

    /// Auth secret. Base64 encoded string of 16 bytes of random data.
    @HiveField(1) required String auth,
  }) = _MastodonApiPushSubscriptionKeys;

  factory MastodonApiPushSubscriptionKeys.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPushSubscriptionKeysFromJson(json);
}

extension IMastodonApiPushSubscriptionKeysInterfaceExtension
    on IMastodonApiPushSubscriptionKeys {
  MastodonApiPushSubscriptionKeys toMastodonApiPushSubscriptionKeys({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPushSubscriptionKeys(
          p256dh: p256dh,
          auth: auth,
        ),
        forceNewObject: forceNewObject,
      );
}
