import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/application/client/unifedi_api_client_application_model.dart';
import '../../../api/application/service/unifedi_api_application_service.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../client/unifedi_api_client_application_model_mastodon_adapter.dart';

class UnifediApiApplicationServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiApplicationService {
  final MastodonApiApplicationApplicationAccessService
      mastodonApiApplicationApplicationAccessService;

  UnifediApiApplicationServiceMastodonAdapter({
    required this.mastodonApiApplicationApplicationAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiApplicationApplicationAccessService.restService,
      );

  @override
  IUnifediApiFeature get verifyMyCredentialsFeature =>
      mastodonApiApplicationApplicationAccessService.verifyMyCredentialsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiClientApplication> verifyMyCredentials() =>
      mastodonApiApplicationApplicationAccessService.verifyMyCredentials().then(
            (value) => value.toUnifediApiClientApplicationMastodonAdapter(),
          );
}
