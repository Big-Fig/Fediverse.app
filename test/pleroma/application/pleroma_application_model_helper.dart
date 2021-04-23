import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';

PleromaApiApplication createTestPleromaApplication(String seed) =>
    PleromaApiApplication(
      name: seed + "name",
      website: seed + "website",
      vapidKey: seed + "vapidKey",
    );
