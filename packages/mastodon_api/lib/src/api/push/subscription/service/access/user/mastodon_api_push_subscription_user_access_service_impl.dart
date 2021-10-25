import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../../feature/mastodon_api_feature_model.dart';
import '../../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../../rest/mastodon_api_rest_service.dart';
import '../../../../../service/mastodon_api_service_impl.dart';
import '../../../alerts/mastodon_api_push_subscription_alerts_model.dart';
import '../../../mastodon_api_push_subscription_model_impl.dart';
import '../../../metadata/mastodon_api_push_subscription_metadata_model.dart';
import 'mastodon_api_push_subscription_user_access_service.dart';

class MastodonApiPushSubscriptionUserAccessService extends MastodonApiService
    implements IMastodonApiPushSubscriptionUserAccessService {
  static const subscriptionRelativeUrlPath = 'api/v1/push/subscription';

  MastodonApiPushSubscriptionUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<MastodonApiPushSubscription> subscribe({
    required IMastodonApiPushSubscriptionMetadata metadata,
    required IMastodonApiPushSubscriptionAlerts alerts,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: subscribeFeature,
        fieldFeatures: null,
        request: createSubscribeRequest(
          metadata: metadata,
          alerts: alerts,
        ),
        jsonParser: (json) => MastodonApiPushSubscription.fromJson(json),
      );

  RestRequest createSubscribeRequest({
    required IMastodonApiPushSubscriptionMetadata metadata,
    required IMastodonApiPushSubscriptionAlerts alerts,
  }) =>
      RestRequest.post(
        relativePath: subscriptionRelativeUrlPath,
        bodyJson: <String, dynamic>{
          'subscription': metadata.toJson(),
          'data': {
            'alerts': alerts.toJson(),
          },
        },
      );

  @override
  Future<MastodonApiPushSubscription> getCurrentSubscription() =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getCurrentSubscriptionFeature,
        fieldFeatures: null,
        request: createGetCurrentSubscriptionRequest(),
        jsonParser: (json) => MastodonApiPushSubscription.fromJson(json),
      );

  RestRequest createGetCurrentSubscriptionRequest() => RestRequest.get(
        relativePath: subscriptionRelativeUrlPath,
      );

  @override
  Future<void> unsubscribe() => restService.sendHttpRequestAndProcessEmpty(
        requestFeature: unsubscribeFeature,
        fieldFeatures: null,
        request: createUnsubscribeRequest(),
      );

  RestRequest createUnsubscribeRequest() => RestRequest.delete(
        relativePath: subscriptionRelativeUrlPath,
      );

  @override
  IMastodonApiFeature get getCurrentSubscriptionFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.push,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_0,
      );

  @override
  IMastodonApiFeature get subscribeFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.push,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_0,
      );

  @override
  IMastodonApiFeature get unsubscribeFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.push,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_0,
      );
}
