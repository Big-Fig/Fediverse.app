import '../../../../../feature/pleroma_api_feature_model.dart';
import '../../../../../service/pleroma_api_service.dart';
import '../../../alerts/pleroma_api_push_subscription_alerts_model.dart';
import '../../../metadata/pleroma_api_push_subscription_metadata_model.dart';
import '../../../pleroma_api_push_subscription_model.dart';

abstract class IPleromaApiPushSubscriptionUserAccessService
    extends IPleromaApiService {
  IPleromaApiFeature get subscribeFeature;

  Future<IPleromaApiPushSubscription> subscribe({
    required IPleromaApiPushSubscriptionMetadata metadata,
    required IPleromaApiPushSubscriptionAlerts alerts,
  });

  IPleromaApiFeature get getCurrentSubscriptionFeature;

  Future<IPleromaApiPushSubscription> getCurrentSubscription();

  IPleromaApiFeature get unsubscribeFeature;

  Future<void> unsubscribe();
}
