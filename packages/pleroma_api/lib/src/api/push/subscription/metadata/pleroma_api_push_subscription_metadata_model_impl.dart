import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../keys/pleroma_api_push_subscription_keys_model_impl.dart';
import 'pleroma_api_push_subscription_metadata_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_push_subscription_metadata_model_impl.freezed.dart';

part 'pleroma_api_push_subscription_metadata_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiPushSubscriptionMetadata
    with _$PleromaApiPushSubscriptionMetadata
    implements IPleromaApiPushSubscriptionMetadata {
  const factory PleromaApiPushSubscriptionMetadata({
    /// Endpoint URL that is called when a notification event occurs.
    @HiveField(0) required String endpoint,
    @HiveField(1) required PleromaApiPushSubscriptionKeys keys,
  }) = _PleromaApiPushSubscribeRequestSubscription;

  factory PleromaApiPushSubscriptionMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPushSubscriptionMetadataFromJson(json);
}

extension IPleromaApiPushSubscriptionMetadataInterfaceExtension
    on IPleromaApiPushSubscriptionMetadata {
  PleromaApiPushSubscriptionMetadata toPleromaApiPushSubscriptionMetadata({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPushSubscriptionMetadata(
          endpoint: endpoint,
          keys: keys.toPleromaApiPushSubscriptionKeys(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
