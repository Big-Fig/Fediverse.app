import '../../feature/unifedi_api_feature_model.dart';
import '../../unifedi_api_service.dart';
import '../client/unifedi_api_client_application_model.dart';

abstract class IUnifediApiApplicationService implements IUnifediApiService {
  IUnifediApiFeature get verifyMyCredentialsFeature;

  Future<IUnifediApiClientApplication> verifyMyCredentials();
}
