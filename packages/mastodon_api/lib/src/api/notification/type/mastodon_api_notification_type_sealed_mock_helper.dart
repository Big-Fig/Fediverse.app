import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'mastodon_api_notification_type_sealed.dart';

abstract class MastodonApiNotificationTypeMockHelper {
  static MastodonApiNotificationType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiNotificationType.values,
      );
}
