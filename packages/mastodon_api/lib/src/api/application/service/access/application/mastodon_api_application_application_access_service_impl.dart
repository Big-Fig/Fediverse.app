import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../access/mastodon_api_access_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../client/mastodon_api_client_application_model.dart';
import '../../../client/mastodon_api_client_application_model_impl.dart';
import 'mastodon_api_application_application_access_service.dart';

class MastodonApiApplicationApplicationAccessService extends MastodonApiService
    implements IMastodonApiApplicationApplicationAccessService {
  static const appsRelativeUrlPath = '/api/v1/apps/';

  MastodonApiApplicationApplicationAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IMastodonApiClientApplication> verifyMyCredentials() =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: verifyMyCredentialsFeature,
        fieldFeatures: createVerifyMyCredentialsFieldFeatures(),
        request: createVerifyMyCredentialsRequest(),
        jsonParser: (json) => MastodonApiClientApplication.fromJson(json),
      );

  RestRequest createVerifyMyCredentialsRequest() => RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            MastodonApiApplicationApplicationAccessService.appsRelativeUrlPath,
            'verify_credentials',
          ],
        ),
      );

  List<IMastodonApiFeature>? createVerifyMyCredentialsFieldFeatures() => null;

  @override
  IMastodonApiFeature<IMastodonApiAccess> get verifyMyCredentialsFeature =>
      MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.applicationRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_0_0,
      );
}
