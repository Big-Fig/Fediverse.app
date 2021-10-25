// ignore_for_file: no-magic-number, no-equal-arguments
import 'mastodon_api_instance_activity_item_model_impl.dart';

class MastodonApiInstanceActivityItemMockHelper {
  static MastodonApiInstanceActivityItem generate({
    required String seed,
  }) =>
      MastodonApiInstanceActivityItem(
        logins: seed.hashCode + 'logins'.hashCode,
        registrations: seed.hashCode + 'registrations'.hashCode,
        statuses: seed.hashCode + 'statuses'.hashCode,
        week: seed.hashCode + 'week'.hashCode,
      );
}
