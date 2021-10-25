import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './mastodon_api_scheduled_status_model_impl.dart';
import '../../media/attachment/mastodon_api_media_attachment_model_impl_mock_helper.dart';
import 'params/mastodon_api_scheduled_status_params_model_impl_mock_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class MastodonApiScheduledStatusMockHelper {
  static MastodonApiScheduledStatus generate({
    required String seed,
  }) =>
      MastodonApiScheduledStatus(
        id: seed + 'id',
        mediaAttachments: [
          MastodonApiMediaAttachmentMockHelper.generate(
            seed: seed + '1',
          ),
          MastodonApiMediaAttachmentMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        params: MastodonApiScheduledStatusParamsMockHelper.generate(
          seed: seed,
        ),
        scheduledAt: DateTimeMockHelper.generate(
          seed: seed,
        ),
      );
}
