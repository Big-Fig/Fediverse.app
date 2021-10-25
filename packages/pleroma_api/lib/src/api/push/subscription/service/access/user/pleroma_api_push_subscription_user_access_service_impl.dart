import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../../feature/pleroma_api_feature_model.dart';
import '../../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../../rest/pleroma_api_rest_service.dart';
import '../../../../../service/pleroma_api_service_impl.dart';
import '../../../alerts/pleroma_api_push_subscription_alerts_model.dart';
import '../../../metadata/pleroma_api_push_subscription_metadata_model.dart';
import '../../../pleroma_api_push_subscription_model_impl.dart';
import 'pleroma_api_push_subscription_user_access_service.dart';

class PleromaApiPushSubscriptionUserAccessService extends PleromaApiService
    implements IPleromaApiPushSubscriptionUserAccessService {
  final MastodonApiPushSubscriptionUserAccessService
      mastodonApiPushSubscriptionUserAccessService;

  PleromaApiPushSubscriptionUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiPushSubscriptionUserAccessService =
            MastodonApiPushSubscriptionUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiPushSubscriptionUserAccessService.disposeWith(this);
  }

  @override
  Future<PleromaApiPushSubscription> subscribe({
    required IPleromaApiPushSubscriptionMetadata metadata,
    required IPleromaApiPushSubscriptionAlerts alerts,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: subscribeFeature,
        fieldFeatures: null,
        request:
            mastodonApiPushSubscriptionUserAccessService.createSubscribeRequest(
          metadata: metadata,
          alerts: alerts,
        ),
        jsonParser: (json) => PleromaApiPushSubscription.fromJson(json),
      );

  @override
  Future<PleromaApiPushSubscription> getCurrentSubscription() =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getCurrentSubscriptionFeature,
        fieldFeatures: null,
        request: mastodonApiPushSubscriptionUserAccessService
            .createGetCurrentSubscriptionRequest(),
        jsonParser: (json) => PleromaApiPushSubscription.fromJson(json),
      );

  @override
  Future<void> unsubscribe() => restService.sendHttpRequestAndProcessEmpty(
        requestFeature: unsubscribeFeature,
        fieldFeatures: null,
        request: mastodonApiPushSubscriptionUserAccessService
            .createUnsubscribeRequest(),
      );

  @override
  IPleromaApiFeature get getCurrentSubscriptionFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiPushSubscriptionUserAccessService
            .getCurrentSubscriptionFeature,
      );

  @override
  IPleromaApiFeature get subscribeFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiPushSubscriptionUserAccessService.subscribeFeature,
      );

  @override
  IPleromaApiFeature get unsubscribeFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiPushSubscriptionUserAccessService.unsubscribeFeature,
      );
}
