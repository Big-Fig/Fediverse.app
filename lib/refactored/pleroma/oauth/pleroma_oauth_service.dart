import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef AuthorizationCodeSuccessCallback(String code);
typedef AuthorizationCodeErrorCallback(error);

abstract class IPleromaOAuthService extends IPleromaApi {


  static IPleromaOAuthService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaOAuthService>(context, listen: listen);

  Future<bool> launchAuthorizeFormAndExtractAuthorizationCode(
      {@required PleromaOAuthAuthorizeRequest authorizeRequest,
      @required AuthorizationCodeSuccessCallback successCallback,
      @required AuthorizationCodeErrorCallback errorCallback});

  Future<PleromaOAuthToken> retrieveAccountAccessToken(
      {@required PleromaOAuthAccountTokenRequest tokenRequest});

  Future<PleromaOAuthToken> retrieveAppAccessToken(
      {@required PleromaOAuthAppTokenRequest tokenRequest});

  Future<bool> revokeToken(
      {@required PleromaOAuthAppTokenRevokeRequest revokeRequest});
}
