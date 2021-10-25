import '../../../unifedi_api_model.dart';
import '../keys/unifedi_api_push_subscription_keys_model.dart';

abstract class IUnifediApiPushSubscriptionMetadata
    implements IUnifediApiObject {
  /// Endpoint URL that is called when a notification event occurs.
  String? get endpoint;

  IUnifediApiPushSubscriptionKeys? get keys;
}
