import '../../../../../feature/mastodon_api_feature_model.dart';
import '../../../../../service/mastodon_api_service.dart';
import '../../../alerts/mastodon_api_push_subscription_alerts_model.dart';
import '../../../mastodon_api_push_subscription_model.dart';
import '../../../metadata/mastodon_api_push_subscription_metadata_model.dart';

abstract class IMastodonApiPushSubscriptionUserAccessService
    extends IMastodonApiService {
  IMastodonApiFeature get subscribeFeature;

  Future<IMastodonApiPushSubscription> subscribe({
    required IMastodonApiPushSubscriptionMetadata metadata,
    required IMastodonApiPushSubscriptionAlerts alerts,
  });

  IMastodonApiFeature get getCurrentSubscriptionFeature;

  Future<IMastodonApiPushSubscription> getCurrentSubscription();

  IMastodonApiFeature get unsubscribeFeature;

  Future<void> unsubscribe();
}
