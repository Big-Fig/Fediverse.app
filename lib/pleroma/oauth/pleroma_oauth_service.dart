import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef dynamic AuthorizationCodeSuccessCallback(String code);
typedef dynamic AuthorizationCodeErrorCallback(error);

abstract class IPleromaOAuthService extends IPleromaApi {
  static IPleromaOAuthService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaOAuthService>(
        context,
        listen: listen,
      );

  Future<String?> launchAuthorizeFormAndExtractAuthorizationCode({
    required PleromaOAuthAuthorizeRequest authorizeRequest,
  });

  static String extractAuthCodeFromUri(Uri uri) =>
      uri.queryParameters['code'].toString();

  Future<PleromaOAuthToken> retrieveAccountAccessToken({
    required PleromaOAuthAccountTokenRequest tokenRequest,
  });

  Future<PleromaOAuthToken?> retrieveAppAccessToken({
    required PleromaOAuthAppTokenRequest tokenRequest,
  });

  Future<bool> revokeToken({
    required PleromaOAuthAppTokenRevokeRequest revokeRequest,
  });
}
