import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../../visibility/pleroma_api_visibility_sealed_mock_helper.dart';
import '../../post/poll/pleroma_api_post_status_poll_model_impl_mock_helper.dart';
import 'pleroma_api_scheduled_status_params_model_impl.dart';

// ignore_for_file: no-magic-number

class PleromaApiScheduledStatusParamsMockHelper {
  static PleromaApiScheduledStatusParams generate({
    required String seed,
  }) =>
      PleromaApiScheduledStatusParams(
        text: seed + 'text1',
        mediaIds: [
          seed + 'mediaIds1',
          seed + 'mediaIds2',
        ],
        sensitive: seed.hashCode % 2 == 0,
        spoilerText: seed + 'spoilerText1',
        visibility: PleromaApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        scheduledAt: DateTime(seed.hashCode % 10),
        poll: PleromaApiPostStatusPollMockHelper.generate(seed: seed),
        inReplyToId: seed + 'inReplyToId1',
        to: [
          seed + '1',
          seed + '2',
        ],
        expiresInSeconds: DurationMockHelper.generate(seed: seed).inSeconds,
        language: seed + 'language',
        inReplyToConversationId: seed + 'inReplyToConversationId',
      );
}
