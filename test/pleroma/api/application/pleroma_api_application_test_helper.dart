import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';

class PleromaApiApplicationTestHelper {
  static PleromaApiApplication createTestPleromaApiApplication(String seed) =>
      PleromaApiApplication(
        name: seed + "name",
        website: seed + "website",
        vapidKey: seed + "vapidKey",
      );
}
