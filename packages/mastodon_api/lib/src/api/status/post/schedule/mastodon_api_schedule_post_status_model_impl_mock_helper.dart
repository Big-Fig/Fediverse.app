import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './mastodon_api_schedule_post_status_model_impl.dart';
import '../../../visibility/mastodon_api_visibility_sealed_mock_helper.dart';
import '../poll/mastodon_api_post_status_poll_model_impl_mock_helper.dart';
import 'mastodon_api_schedule_post_status_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class MastodonApiSchedulePostStatusMockHelper {
  static MastodonApiSchedulePostStatus generate({
    required String seed,
  }) =>
      MastodonApiSchedulePostStatus(
        inReplyToId: seed + 'inReplyToId',
        language: seed + 'language',
        visibility: MastodonApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        mediaIds: [
          seed + '1',
          seed + '2',
        ],
        poll: MastodonApiPostStatusPollMockHelper.generate(seed: seed),
        sensitive: seed.hashCode % 2 == 1,
        spoilerText: seed + 'spoilerText',
        status: seed + 'status',
        scheduledAt: DateTimeMockHelper.generate(seed: seed),
      );
}
