import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../mastodon_api_poll_model.dart';
import '../public/mastodon_api_poll_public_access_service.dart';

abstract class IMastodonApiPollUserAccessService
    implements IMastodonApiPollPublicAccessService {
  IMastodonApiFeature get voteFeature;

  Future<IMastodonApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  });
}
