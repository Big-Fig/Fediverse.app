import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model.dart';
import '../../../api/push/subscription/unifedi_api_push_subscription_model.dart';
import 'alerts/unifedi_api_push_subscription_alerts_model_pleroma_adapter.dart';

part 'unifedi_api_push_subscription_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_push_subscription_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionPleromaAdapter
    with _$UnifediApiPushSubscriptionPleromaAdapter
    implements IUnifediApiPushSubscription {
  const UnifediApiPushSubscriptionPleromaAdapter._();
  const factory UnifediApiPushSubscriptionPleromaAdapter(
    @HiveField(0) PleromaApiPushSubscription value,
  ) = _UnifediApiPushSubscriptionPleromaAdapter;

  @override
  IUnifediApiPushSubscriptionAlerts get alerts =>
      value.alerts.toUnifediApiPushSubscriptionAlertsPleromaAdapter();

  @override
  String get endpoint => value.endpoint;

  @override
  String get id => value.id;

  @override
  String get serverKey => value.serverKey;
  factory UnifediApiPushSubscriptionPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionPleromaAdapterFromJson(json);
}

extension PleromaApiPushSubscriptionUnifediExtension
    on IPleromaApiPushSubscription {
  UnifediApiPushSubscriptionPleromaAdapter
      toUnifediApiPushSubscriptionPleromaAdapter() =>
          UnifediApiPushSubscriptionPleromaAdapter(
            toPleromaApiPushSubscription(),
          );
}

extension PleromaApiPushSubscriptionUnifediListExtension
    on List<IPleromaApiPushSubscription> {
  List<UnifediApiPushSubscriptionPleromaAdapter>
      toUnifediApiPushSubscriptionPleromaAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionPleromaAdapter(),
          ).toList();
}
