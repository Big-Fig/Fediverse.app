import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_poll_model.dart';
import '../../../mastodon_api_poll_model_impl.dart';
import 'mastodon_api_poll_public_access_service.dart';

class MastodonApiPollPublicAccessService extends MastodonApiService
    implements IMastodonApiPollPublicAccessService {
  static const pollRelativeUrlPath = '/api/v1/polls/';

  MastodonApiPollPublicAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IMastodonApiPoll> getPoll({
    required String pollId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getPollFeature,
        fieldFeatures: null,
        request: createGetPollRequest(
          pollId: pollId,
        ),
        jsonParser: (json) => MastodonApiPoll.fromJson(json),
      );

  RestRequest createGetPollRequest({
    required String pollId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            pollRelativeUrlPath,
            pollId,
          ],
        ),
      );

  @override
  IMastodonApiFeature get getPollFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );
}
