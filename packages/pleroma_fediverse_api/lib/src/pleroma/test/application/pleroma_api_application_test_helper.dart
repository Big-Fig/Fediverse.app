import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiApplicationTestHelper {
  static PleromaApiApplication createTestPleromaApiApplication({
    required String seed,
  }) =>
      PleromaApiApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
      );

  static PleromaApiClientApplication createTestPleromaApiClientApplication({
    required String seed,
  }) =>
      PleromaApiClientApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
        clientId: seed + 'clientId',
        clientSecret: seed + 'clientSecret',
      );
}
