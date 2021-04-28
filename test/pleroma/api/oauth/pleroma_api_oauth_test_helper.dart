// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';

class PleromaApiOAuthTestHelper {
  static PleromaApiOAuthToken createTestPleromaApiOAuthToken({
    required String seed,
  }) {
    return PleromaApiOAuthToken(
      accessToken: seed + "accessToken",
      tokenType: seed + "tokenType",
      scope: seed + "tokenType",
      createdAt: DateTime(seed.hashCode % 2001),
    );
  }
}
