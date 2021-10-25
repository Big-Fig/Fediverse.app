import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../client/pleroma_api_client_application_model.dart';

abstract class IPleromaApiApplicationApplicationAccessService
    implements IPleromaApiService {
  IPleromaApiFeature get verifyMyCredentialsFeature;

  Future<IPleromaApiClientApplication> verifyMyCredentials();
}
