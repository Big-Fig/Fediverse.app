// ignore_for_file: no-magic-number
import 'unifedi_api_oauth_model_impl.dart';

class UnifediApiOAuthTokenMockHelper {
  static UnifediApiOAuthToken generate({
    required String seed,
  }) =>
      UnifediApiOAuthToken(
        accessToken: seed + 'accessToken',
        tokenType: seed + 'tokenType',
        id: seed + 'id',
        me: seed + 'me',
      );
}
