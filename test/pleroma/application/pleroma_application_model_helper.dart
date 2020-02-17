import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/mastodon/application/mastodon_application_model.dart';

PleromaApplication createTestPleromaApplication(String seed) =>
    PleromaApplication.allRequired(
        name: MastodonApplicationName.WEB,
        website: seed + "website",
        vapidKey: seed + "vapidKey");
