import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './unifedi_api_post_status_model_impl.dart';
import '../../visibility/unifedi_api_visibility_sealed_mock_helper.dart';
import 'poll/unifedi_api_post_status_poll_model_impl_mock_helper.dart';

abstract class UnifediApiPostStatusMockHelper {
  static UnifediApiPostStatus generate({
    required String seed,
  }) =>
      UnifediApiPostStatus(
        contentType: seed + 'contentType',
        expiresInSeconds:
            DurationMockHelper.generate(seed: seed + 'expiresInSeconds')
                .inSeconds,
        inReplyToConversationId: seed + 'inReplyToConversationId',
        inReplyToId: seed + 'inReplyToId',
        language: seed + 'language',
        visibility: UnifediApiVisibilityMockHelper.generate(
          seed: seed + 'visibility',
        ).stringValue,
        mediaIds: [
          seed + 'mediaIds1',
          seed + 'mediaIds2',
        ],
        poll: UnifediApiPostStatusPollMockHelper.generate(
          seed: seed + 'poll',
        ),
        preview: BoolMockHelper.generate(seed: seed + 'preview'),
        sensitive: BoolMockHelper.generate(seed: seed + 'sensitive'),
        spoilerText: seed + 'spoilerText',
        status: seed + 'status',
        to: [
          seed + 'to1',
          seed + 'to2',
        ],
      );
}
