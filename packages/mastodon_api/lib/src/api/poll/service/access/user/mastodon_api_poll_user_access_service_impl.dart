import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../mastodon_api_poll_model.dart';
import '../../../mastodon_api_poll_model_impl.dart';
import '../public/mastodon_api_poll_public_access_service_impl.dart';
import 'mastodon_api_poll_user_access_service.dart';

class MastodonApiPollUserAccessService
    extends MastodonApiPollPublicAccessService
    implements IMastodonApiPollUserAccessService {
  MastodonApiPollUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IMastodonApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: voteFeature,
        fieldFeatures: null,
        request: createVoteRequest(
          pollId: pollId,
          voteIndexes: voteIndexes,
        ),
        jsonParser: (json) => MastodonApiPoll.fromJson(json),
      );

  RestRequest createVoteRequest({
    required String pollId,
    required List<int> voteIndexes,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            MastodonApiPollPublicAccessService.pollRelativeUrlPath,
            pollId,
            'votes',
          ],
        ),
        bodyJson: <String, dynamic>{
          'choices': voteIndexes,
        },
      );

  @override
  IMastodonApiFeature get voteFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );
}
