import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../../visibility/unifedi_api_visibility_sealed_mock_helper.dart';
import '../../post/poll/unifedi_api_post_status_poll_model_impl_mock_helper.dart';
import 'unifedi_api_scheduled_status_params_model_impl.dart';

// ignore_for_file: no-magic-number

class UnifediApiScheduledStatusParamsMockHelper {
  static UnifediApiScheduledStatusParams generate({
    required String seed,
  }) =>
      UnifediApiScheduledStatusParams(
        text: seed + 'text1',
        mediaIds: [
          seed + 'mediaIds1',
          seed + 'mediaIds2',
        ],
        sensitive: seed.hashCode % 2 == 0,
        spoilerText: seed + 'spoilerText1',
        visibility: UnifediApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        scheduledAt: DateTime(seed.hashCode % 10),
        poll: UnifediApiPostStatusPollMockHelper.generate(seed: seed),
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
