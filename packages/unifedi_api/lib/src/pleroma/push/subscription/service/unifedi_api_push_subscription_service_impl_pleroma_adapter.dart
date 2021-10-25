import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../../api/feature/unifedi_api_feature_model.dart';
import '../../../../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model.dart';
import '../../../../api/push/subscription/metadata/unifedi_api_push_subscription_metadata_model.dart';
import '../../../../api/push/subscription/service/unifedi_api_push_subscription_service.dart';
import '../../../../api/push/subscription/unifedi_api_push_subscription_model.dart';
import '../../../../api/rest/unifedi_api_rest_service.dart';
import '../../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../../service/unifedi_api_service_pleroma_adapter.dart';
import '../alerts/unifedi_api_push_subscription_alerts_model_pleroma_adapter.dart';
import '../metadata/unifedi_api_push_subscription_metadata_model_pleroma_adapter.dart';
import '../unifedi_api_push_subscription_model_pleroma_adapter.dart';

class UnifediApiPushSubscriptionServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiPushSubscriptionService {
  final IPleromaApiPushSubscriptionUserAccessService
      pleromaApiPushSubscriptionUserAccessService;

  UnifediApiPushSubscriptionServicePleromaAdapter({
    required this.pleromaApiPushSubscriptionUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiPushSubscriptionUserAccessService.restService,
      );

  @override
  Future<IUnifediApiPushSubscription> getCurrentSubscription() =>
      pleromaApiPushSubscriptionUserAccessService.getCurrentSubscription().then(
            (value) => value.toUnifediApiPushSubscriptionPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getCurrentSubscriptionFeature =>
      pleromaApiPushSubscriptionUserAccessService.getCurrentSubscriptionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiPushSubscription> subscribe({
    required IUnifediApiPushSubscriptionMetadata metadata,
    required IUnifediApiPushSubscriptionAlerts alerts,
  }) =>
      pleromaApiPushSubscriptionUserAccessService
          .subscribe(
            metadata: metadata.toPleromaApiPushSubscriptionMetadata(),
            alerts: alerts.toPleromaApiPushSubscriptionAlerts(),
          )
          .then(
            (value) => value.toUnifediApiPushSubscriptionPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get subscribeChatMentionFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get subscribeEmojiReactionFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get subscribeFeature =>
      pleromaApiPushSubscriptionUserAccessService.subscribeFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> unsubscribe() =>
      pleromaApiPushSubscriptionUserAccessService.unsubscribe();

  @override
  IUnifediApiFeature get unsubscribeFeature =>
      pleromaApiPushSubscriptionUserAccessService.unsubscribeFeature
          .toUnifediApiFeaturePleromaAdapter();
}
