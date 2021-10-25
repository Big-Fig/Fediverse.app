import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alerts/unifedi_api_push_subscription_alerts_model_impl.dart';
import 'unifedi_api_push_subscription_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_push_subscription_model_impl.freezed.dart';

part 'unifedi_api_push_subscription_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiPushSubscription
    with _$UnifediApiPushSubscription
    implements IUnifediApiPushSubscription {
  const factory UnifediApiPushSubscription({
    @HiveField(0) required String id,
    @HiveField(1) required String endpoint,
    @HiveField(2) required UnifediApiPushSubscriptionAlerts alerts,
    @HiveField(3) @JsonKey(name: 'server_key') required String serverKey,
  }) = _UnifediApiPushSubscription;

  factory UnifediApiPushSubscription.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionFromJson(json);
}

extension IUnifediApiPushSubscriptionInterfaceExtension
    on IUnifediApiPushSubscription {
  UnifediApiPushSubscription toUnifediApiPushSubscription({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPushSubscription(
          id: id,
          endpoint: endpoint,
          alerts: alerts.toUnifediApiPushSubscriptionAlerts(
            forceNewObject: forceNewObject,
          ),
          serverKey: serverKey,
        ),
        forceNewObject: forceNewObject,
      );
}
