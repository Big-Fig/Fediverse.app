// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../account/mastodon_api_account_model_impl_mock_helper.dart';
import '../status/mastodon_api_status_model_impl_mock_helper.dart';
import 'mastodon_api_notification_model_impl.dart';
import 'type/mastodon_api_notification_type_sealed_mock_helper.dart';

class MastodonApiNotificationMockHelper {
  static MastodonApiNotification generate({
    required String seed,
  }) =>
      MastodonApiNotification(
        account: MastodonApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        id: seed + 'id',
        type: MastodonApiNotificationTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        status: MastodonApiStatusMockHelper.generate(seed: seed),
      );
}
