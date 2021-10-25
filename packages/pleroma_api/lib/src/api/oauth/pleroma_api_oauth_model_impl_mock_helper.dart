// ignore_for_file: no-magic-number
import 'pleroma_api_oauth_model_impl.dart';

class PleromaApiOAuthMockHelper {
  static PleromaApiOAuthToken generate({
    required String seed,
  }) =>
      PleromaApiOAuthToken(
        accessToken: seed + 'accessToken',
        tokenType: seed + 'tokenType',
        id: seed + 'id',
        me: seed + 'me',
      );
}
