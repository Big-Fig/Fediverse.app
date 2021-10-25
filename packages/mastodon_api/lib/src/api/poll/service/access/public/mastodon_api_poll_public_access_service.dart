import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_poll_model.dart';

abstract class IMastodonApiPollPublicAccessService extends IMastodonApiService {
  IMastodonApiFeature get getPollFeature;

  Future<IMastodonApiPoll> getPoll({
    required String pollId,
  });
}
