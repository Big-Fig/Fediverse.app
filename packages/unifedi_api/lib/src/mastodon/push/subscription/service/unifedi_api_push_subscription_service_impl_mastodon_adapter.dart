import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../../api/feature/unifedi_api_feature_model.dart';
import '../../../../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model.dart';
import '../../../../api/push/subscription/metadata/unifedi_api_push_subscription_metadata_model.dart';
import '../../../../api/push/subscription/service/unifedi_api_push_subscription_service.dart';
import '../../../../api/push/subscription/unifedi_api_push_subscription_model.dart';
import '../../../../api/rest/unifedi_api_rest_service.dart';
import '../../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../../service/unifedi_api_service_mastodon_adapter.dart';
import '../alerts/unifedi_api_push_subscription_alerts_model_mastodon_adapter.dart';
import '../metadata/unifedi_api_push_subscription_metadata_model_mastodon_adapter.dart';
import '../unifedi_api_push_subscription_model_mastodon_adapter.dart';

class UnifediApiPushSubscriptionServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiPushSubscriptionService {
  final IMastodonApiPushSubscriptionUserAccessService
      mastodonApiPushSubscriptionUserAccessService;

  UnifediApiPushSubscriptionServiceMastodonAdapter({
    required this.mastodonApiPushSubscriptionUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiPushSubscriptionUserAccessService.restService,
      );

  @override
  Future<IUnifediApiPushSubscription> getCurrentSubscription() =>
      mastodonApiPushSubscriptionUserAccessService
          .getCurrentSubscription()
          .then(
            (value) => value.toUnifediApiPushSubscriptionMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getCurrentSubscriptionFeature =>
      mastodonApiPushSubscriptionUserAccessService.getCurrentSubscriptionFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiPushSubscription> subscribe({
    required IUnifediApiPushSubscriptionMetadata metadata,
    required IUnifediApiPushSubscriptionAlerts alerts,
  }) =>
      mastodonApiPushSubscriptionUserAccessService
          .subscribe(
            metadata: metadata.toMastodonApiPushSubscriptionMetadata(),
            alerts: alerts.toMastodonApiPushSubscriptionAlerts(),
          )
          .then(
            (value) => value.toUnifediApiPushSubscriptionMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get subscribeChatMentionFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get subscribeEmojiReactionFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get subscribeFeature =>
      mastodonApiPushSubscriptionUserAccessService.subscribeFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> unsubscribe() =>
      mastodonApiPushSubscriptionUserAccessService.unsubscribe();

  @override
  IUnifediApiFeature get unsubscribeFeature =>
      mastodonApiPushSubscriptionUserAccessService.unsubscribeFeature
          .toUnifediApiFeatureMastodonAdapter();
}
