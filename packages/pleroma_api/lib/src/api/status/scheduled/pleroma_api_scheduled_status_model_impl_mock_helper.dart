import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './pleroma_api_scheduled_status_model_impl.dart';
import '../../media/attachment/pleroma_api_media_attachment_model_impl_mock_helper.dart';
import 'params/pleroma_api_scheduled_status_params_model_impl_mock_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class PleromaApiScheduledStatusMockHelper {
  static PleromaApiScheduledStatus generate({
    required String seed,
  }) =>
      PleromaApiScheduledStatus(
        id: seed + 'id',
        mediaAttachments: [
          PleromaApiMediaAttachmentMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiMediaAttachmentMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        params: PleromaApiScheduledStatusParamsMockHelper.generate(
          seed: seed,
        ),
        scheduledAt: DateTimeMockHelper.generate(
          seed: seed,
        ),
      );
}
