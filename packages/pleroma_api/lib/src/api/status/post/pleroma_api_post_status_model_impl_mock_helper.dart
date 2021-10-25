import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './pleroma_api_post_status_model_impl.dart';
import '../../visibility/pleroma_api_visibility_sealed_mock_helper.dart';
import 'poll/pleroma_api_post_status_poll_model_impl_mock_helper.dart';

abstract class PleromaApiPostStatusMockHelper {
  static PleromaApiPostStatus generate({
    required String seed,
  }) =>
      PleromaApiPostStatus(
        contentType: seed + 'contentType',
        expiresInSeconds:
            DurationMockHelper.generate(seed: seed + 'expiresInSeconds')
                .inSeconds,
        inReplyToConversationId: seed + 'inReplyToConversationId',
        inReplyToId: seed + 'inReplyToId',
        language: seed + 'language',
        visibility: PleromaApiVisibilityMockHelper.generate(
          seed: seed + 'visibility',
        ).stringValue,
        mediaIds: [
          seed + 'mediaIds1',
          seed + 'mediaIds2',
        ],
        poll: PleromaApiPostStatusPollMockHelper.generate(
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
