import 'package:pleroma_fediverse_api/src/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

typedef AuthorizationCodeSuccessCallback = dynamic Function(String code);
typedef AuthorizationCodeErrorCallback = dynamic Function(dynamic error);

abstract class IPleromaApiOAuthService extends IPleromaApi {
  static final oauthRelativeUrlPath = '/oauth/';

  static String extractAuthCodeFromUri(Uri uri) =>
      uri.queryParameters['code'].toString();

  Future<PleromaApiOAuthToken> retrieveAccountAccessToken({
    required PleromaApiOAuthAccountTokenRequest tokenRequest,
  });

  Future<PleromaApiOAuthToken> retrieveAppAccessToken({
    required PleromaApiOAuthAppTokenRequest tokenRequest,
  });

  Future revokeToken({
    required PleromaApiOAuthAppTokenRevokeRequest revokeRequest,
  });
}
