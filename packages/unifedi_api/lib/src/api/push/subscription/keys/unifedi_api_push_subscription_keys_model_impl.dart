import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_push_subscription_keys_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_push_subscription_keys_model_impl.freezed.dart';

part 'unifedi_api_push_subscription_keys_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiPushSubscriptionKeys
    with _$UnifediApiPushSubscriptionKeys
    implements IUnifediApiPushSubscriptionKeys {
  const factory UnifediApiPushSubscriptionKeys({
    /// User agent public key.
    /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
    @HiveField(0) required String p256dh,

    /// Auth secret. Base64 encoded string of 16 bytes of random data.
    @HiveField(1) required String auth,
  }) = _UnifediApiPushSubscriptionKeys;

  factory UnifediApiPushSubscriptionKeys.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionKeysFromJson(json);
}

extension IUnifediApiPushSubscriptionKeysInterfaceExtension
    on IUnifediApiPushSubscriptionKeys {
  UnifediApiPushSubscriptionKeys toUnifediApiPushSubscriptionKeys({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPushSubscriptionKeys(
          p256dh: p256dh,
          auth: auth,
        ),
        forceNewObject: forceNewObject,
      );
}
