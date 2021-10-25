import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../access/mastodon_api_access_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../oauth/mastodon_api_oauth_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';

import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../register/mastodon_api_register_account_model.dart';
import '../../../register/response/mastodon_api_register_account_response_model_impl.dart';
import '../public/mastodon_api_account_public_access_service_impl.dart';
import 'mastodon_api_account_application_access_service.dart';

class MastodonApiAccountApplicationAccessService
    extends MastodonApiAccountPublicAccessService
    implements IMastodonApiAccountApplicationAccessService {
  MastodonApiAccountApplicationAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get registerAccountFeature =>
      MastodonApiFeature.onlyApplicationRequirements.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
      );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get registerAccountReasonFeature =>
      MastodonApiFeature.onlyApplicationRequirements.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  // ignore: long-parameter-list
  Future<MastodonApiRegisterAccountResponse> registerAccount({
    required IMastodonApiRegisterAccount registerAccount,
  }) async {
    var token = await restService.sendHttpRequestAndParseJson(
      requestFeature: registerAccountFeature,
      fieldFeatures: createRegisterAccountFieldFeatures(
        registerAccount: registerAccount,
      ),
      request: createRegisterAccountRequest(
        registerAccount: registerAccount,
      ),
      jsonParser: (json) => MastodonApiOAuthToken.fromJson(json),
    );

    return MastodonApiRegisterAccountResponse(
      approvalRequired:
          restService.accessBloc.access.instance?.approvalRequired,
      authToken: token,
    );
  }

  List<IMastodonApiFeature<IMastodonApiAccess>>
      createRegisterAccountFieldFeatures({
    required IMastodonApiRegisterAccount registerAccount,
  }) =>
          [
            if (registerAccount.reason != null) registerAccountReasonFeature,
          ];

  RestRequest createRegisterAccountRequest({
    required IMastodonApiRegisterAccount registerAccount,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join([
          accountRelativeUrlPath,
        ]),
        bodyJson: <String, dynamic>{
          'username': registerAccount.username,
          'email': registerAccount.email,
          'password': registerAccount.password,
          'agreement': registerAccount.agreement,
          'locale': registerAccount.locale,
          if (registerAccount.reason != null) 'reason': registerAccount.reason,
        },
      );
}
