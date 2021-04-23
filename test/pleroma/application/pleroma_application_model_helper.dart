import 'package:fedi/pleroma/api/application/pleroma_application_model.dart';

PleromaApplication createTestPleromaApplication(String seed) =>
    PleromaApplication(
      name: seed + "name",
      website: seed + "website",
      vapidKey: seed + "vapidKey",
    );
