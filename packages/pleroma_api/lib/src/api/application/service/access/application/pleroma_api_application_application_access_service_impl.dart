import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../client/pleroma_api_client_application_model.dart';
import '../../../client/pleroma_api_client_application_model_impl.dart';
import 'pleroma_api_application_application_access_service.dart';

class PleromaApiApplicationApplicationAccessService extends PleromaApiService
    implements IPleromaApiApplicationApplicationAccessService {
  final MastodonApiApplicationApplicationAccessService
      mastodonApiApplicationApplicationAccessService;

  PleromaApiApplicationApplicationAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiApplicationApplicationAccessService =
            MastodonApiApplicationApplicationAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiApplicationApplicationAccessService.disposeWith(this);
  }

  @override
  Future<IPleromaApiClientApplication> verifyMyCredentials() =>
      restService.sendHttpRequestAndParseJson(
        request: mastodonApiApplicationApplicationAccessService
            .createVerifyMyCredentialsRequest(),
        requestFeature: verifyMyCredentialsFeature,
        fieldFeatures: null,
        jsonParser: (json) => PleromaApiClientApplication.fromJson(json),
      );

  @override
  IPleromaApiFeature get verifyMyCredentialsFeature =>
      PleromaApiFeature.onlyApplicationRequirements(
        mastodonApiApplicationApplicationAccessService
            .verifyMyCredentialsFeature,
      );
}
