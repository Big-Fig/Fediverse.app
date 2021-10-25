import '../../../oauth/unifedi_api_oauth_model.dart';
import '../../../unifedi_api_model.dart';

abstract class IUnifediApiRegisterAccountResponse implements IUnifediApiObject {
  bool? get approvalRequired;

  bool? get emailConformationRequired;

  IUnifediApiOAuthToken? get authToken;
}
