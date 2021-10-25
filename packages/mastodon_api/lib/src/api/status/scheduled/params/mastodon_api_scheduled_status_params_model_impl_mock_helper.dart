import '../../../visibility/mastodon_api_visibility_sealed_mock_helper.dart';
import '../../post/poll/mastodon_api_post_status_poll_model_impl_mock_helper.dart';
import 'mastodon_api_scheduled_status_params_model_impl.dart';

// ignore_for_file: no-magic-number

class MastodonApiScheduledStatusParamsMockHelper {
  static MastodonApiScheduledStatusParams generate({
    required String seed,
  }) =>
      MastodonApiScheduledStatusParams(
        text: seed + 'text1',
        mediaIds: [
          seed + 'mediaIds1',
          seed + 'mediaIds2',
        ],
        sensitive: seed.hashCode % 2 == 0,
        spoilerText: seed + 'spoilerText1',
        visibility: MastodonApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        scheduledAt: DateTime(seed.hashCode % 10),
        poll: MastodonApiPostStatusPollMockHelper.generate(seed: seed),
        inReplyToId: seed + 'inReplyToId1',
        language: seed + 'language',
      );
}
