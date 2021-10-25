import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../register/mastodon_api_register_account_model.dart';
import '../../../register/response/mastodon_api_register_account_response_model.dart';
import '../public/mastodon_api_account_public_access_service.dart';

abstract class IMastodonApiAccountApplicationAccessService
    implements IMastodonApiAccountPublicAccessService {
  IMastodonApiFeature get registerAccountFeature;

  IMastodonApiFeature get registerAccountReasonFeature;

  Future<IMastodonApiRegisterAccountResponse> registerAccount({
    required IMastodonApiRegisterAccount registerAccount,
  });
}
