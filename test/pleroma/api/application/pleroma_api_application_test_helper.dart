import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';

class PleromaApiApplicationTestHelper {
  static PleromaApiApplication createTestPleromaApiApplication({
    required String seed,
  }) =>
      PleromaApiApplication(
        name: seed + "name",
        website: seed + "website",
        vapidKey: seed + "vapidKey",
      );

  static PleromaApiClientApplication createTestPleromaApiClientApplication({
    required String seed,
  }) =>
      PleromaApiClientApplication(
        name: seed + "name",
        website: seed + "website",
        vapidKey: seed + "vapidKey",
        clientId: seed + "clientId",
        clientSecret: seed + "clientSecret",
      );
}
