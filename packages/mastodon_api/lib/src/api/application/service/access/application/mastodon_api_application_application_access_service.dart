import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../client/mastodon_api_client_application_model.dart';

abstract class IMastodonApiApplicationApplicationAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get verifyMyCredentialsFeature;

  Future<IMastodonApiClientApplication> verifyMyCredentials();
}
