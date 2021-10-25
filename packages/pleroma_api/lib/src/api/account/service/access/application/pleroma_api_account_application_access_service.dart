import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../register/pleroma_api_register_account_model.dart';
import '../../../register/response/pleroma_api_register_account_response_model.dart';
import '../public/pleroma_api_account_public_access_service.dart';

abstract class IPleromaApiAccountApplicationAccessService
    implements IPleromaApiAccountPublicAccessService {
  IPleromaApiFeature get registerAccountFeature;

  IPleromaApiFeature get registerAccountReasonFeature;

  Future<IPleromaApiRegisterAccountResponse> registerAccount({
    required IPleromaApiRegisterAccount registerAccount,
  });
}
