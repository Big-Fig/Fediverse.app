import '../../../oauth/pleroma_api_oauth_model.dart';
import '../../../pleroma_api_model.dart';

abstract class IPleromaApiRegisterAccountResponse implements IPleromaApiObject {
  bool? get approvalRequired;

  bool? get emailConformationRequired;

  IPleromaApiOAuthToken? get authToken;
}
