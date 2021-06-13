// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';

class PleromaApiOAuthTestHelper {
  static PleromaApiOAuthToken createTestPleromaApiOAuthToken({
    required String seed,
  }) {
    return PleromaApiOAuthToken(
      accessToken: seed + 'accessToken',
      tokenType: seed + 'tokenType',
      // scope: seed + 'tokenType',
      // createdAt: DateTime(seed.hashCode % 2001),
    );
  }

  static PleromaApiOAuthAppTokenRevokeRequest
      createTestPleromaApiOAuthAppTokenRevokeRequest({
    required String seed,
  }) =>
          PleromaApiOAuthAppTokenRevokeRequest(
            clientId: seed + 'clientId',
            clientSecret: seed + 'clientSecret',
            token: seed + 'token',
          );

  static PleromaApiOAuthAppTokenRequest
      createTestPleromaApiOAuthAppTokenRequest({
    required String seed,
  }) =>
          PleromaApiOAuthAppTokenRequest(
            scope: seed + 'scope',
            redirectUri: seed + 'redirectUri',
            clientId: seed + 'clientId',
            clientSecret: seed + 'clientSecret',
          );

  static PleromaApiOAuthAccountTokenRequest
      createTestPleromaApiOAuthAccountTokenRequest({
    required String seed,
  }) =>
          PleromaApiOAuthAccountTokenRequest(
            code: seed + 'code',
            scope: seed + 'scope',
            redirectUri: seed + 'redirectUri',
            clientId: seed + 'clientId',
            clientSecret: seed + 'clientSecret',
          );

  static PleromaApiOAuthAuthorizeRequest
      createTestPleromaApiOAuthAuthorizeRequest({
    required String seed,
  }) =>
          PleromaApiOAuthAuthorizeRequest(
            forceLogin: seed.hashCode % 2 == 0,
            clientId: seed + 'clientId',
            redirectUri: seed + 'redirectUri',
            scope: seed + 'scope',
          );
}
