import '../../unifedi_api_model.dart';
import 'alerts/unifedi_api_push_subscription_alerts_model.dart';

abstract class IUnifediApiPushSubscription implements IUnifediApiResponse {
  String get id;

  String get endpoint;

  IUnifediApiPushSubscriptionAlerts get alerts;

  String get serverKey;
}
