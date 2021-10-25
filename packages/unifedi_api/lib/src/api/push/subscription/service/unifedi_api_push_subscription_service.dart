import '../../../feature/unifedi_api_feature_model.dart';
import '../../../unifedi_api_service.dart';
import '../alerts/unifedi_api_push_subscription_alerts_model.dart';
import '../metadata/unifedi_api_push_subscription_metadata_model.dart';
import '../unifedi_api_push_subscription_model.dart';

abstract class IUnifediApiPushSubscriptionService extends IUnifediApiService {
  IUnifediApiFeature get subscribeFeature;

  IUnifediApiFeature get subscribeChatMentionFeature;

  IUnifediApiFeature get subscribeEmojiReactionFeature;

  Future<IUnifediApiPushSubscription> subscribe({
    required IUnifediApiPushSubscriptionMetadata metadata,
    required IUnifediApiPushSubscriptionAlerts alerts,
  });

  IUnifediApiFeature get getCurrentSubscriptionFeature;

  Future<IUnifediApiPushSubscription> getCurrentSubscription();

  IUnifediApiFeature get unsubscribeFeature;

  Future<void> unsubscribe();
}
