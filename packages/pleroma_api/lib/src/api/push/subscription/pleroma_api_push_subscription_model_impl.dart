import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alerts/pleroma_api_push_subscription_alerts_model_impl.dart';
import 'pleroma_api_push_subscription_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_push_subscription_model_impl.freezed.dart';

part 'pleroma_api_push_subscription_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiPushSubscription
    with _$PleromaApiPushSubscription
    implements IPleromaApiPushSubscription {
  const factory PleromaApiPushSubscription({
    @HiveField(0) required String id,
    @HiveField(1) required String endpoint,
    @HiveField(2) required PleromaApiPushSubscriptionAlerts alerts,
    @HiveField(3) @JsonKey(name: 'server_key') required String serverKey,
  }) = _PleromaApiPushSubscription;

  factory PleromaApiPushSubscription.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPushSubscriptionFromJson(json);
}

extension IPleromaApiPushSubscriptionInterfaceExtension
    on IPleromaApiPushSubscription {
  PleromaApiPushSubscription toPleromaApiPushSubscription({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPushSubscription(
          id: id,
          endpoint: endpoint,
          alerts: alerts.toPleromaApiPushSubscriptionAlerts(
            forceNewObject: forceNewObject,
          ),
          serverKey: serverKey,
        ),
        forceNewObject: forceNewObject,
      );
}
