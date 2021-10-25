import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './mastodon_api_post_status_model_impl.dart';
import '../../visibility/mastodon_api_visibility_sealed_mock_helper.dart';
import 'poll/mastodon_api_post_status_poll_model_impl_mock_helper.dart';

abstract class MastodonApiPostStatusMockHelper {
  static MastodonApiPostStatus generate({
    required String seed,
  }) =>
      MastodonApiPostStatus(
        inReplyToId: seed + 'inReplyToId',
        language: seed + 'language',
        visibility: MastodonApiVisibilityMockHelper.generate(
          seed: seed + 'visibility',
        ).stringValue,
        mediaIds: [
          seed + 'mediaIds1',
          seed + 'mediaIds2',
        ],
        poll: MastodonApiPostStatusPollMockHelper.generate(
          seed: seed + 'poll',
        ),
        sensitive: BoolMockHelper.generate(seed: seed + 'sensitive'),
        spoilerText: seed + 'spoilerText',
        status: seed + 'status',
      );
}
