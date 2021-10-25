import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/application/client/unifedi_api_client_application_model.dart';
import '../../../api/application/service/unifedi_api_application_service.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../client/unifedi_api_client_application_model_pleroma_adapter.dart';

class UnifediApiApplicationServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiApplicationService {
  final PleromaApiApplicationApplicationAccessService
      pleromaApiApplicationApplicationAccessService;

  UnifediApiApplicationServicePleromaAdapter({
    required this.pleromaApiApplicationApplicationAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiApplicationApplicationAccessService.restService,
      );

  @override
  IUnifediApiFeature get verifyMyCredentialsFeature =>
      pleromaApiApplicationApplicationAccessService.verifyMyCredentialsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiClientApplication> verifyMyCredentials() =>
      pleromaApiApplicationApplicationAccessService.verifyMyCredentials().then(
            (value) => value.toUnifediApiClientApplicationPleromaAdapter(),
          );
}
