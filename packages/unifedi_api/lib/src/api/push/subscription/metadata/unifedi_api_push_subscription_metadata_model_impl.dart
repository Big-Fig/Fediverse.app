import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../keys/unifedi_api_push_subscription_keys_model_impl.dart';
import 'unifedi_api_push_subscription_metadata_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_push_subscription_metadata_model_impl.freezed.dart';

part 'unifedi_api_push_subscription_metadata_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiPushSubscriptionMetadata
    with _$UnifediApiPushSubscriptionMetadata
    implements IUnifediApiPushSubscriptionMetadata {
  const factory UnifediApiPushSubscriptionMetadata({
    /// Endpoint URL that is called when a notification event occurs.
    @HiveField(0) required String? endpoint,
    @HiveField(1) required UnifediApiPushSubscriptionKeys? keys,
  }) = _UnifediApiPushSubscribeRequestSubscription;

  factory UnifediApiPushSubscriptionMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionMetadataFromJson(json);
}

extension IUnifediApiPushSubscriptionMetadataInterfaceExtension
    on IUnifediApiPushSubscriptionMetadata {
  UnifediApiPushSubscriptionMetadata toUnifediApiPushSubscriptionMetadata({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPushSubscriptionMetadata(
          endpoint: endpoint,
          keys: keys?.toUnifediApiPushSubscriptionKeys(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
