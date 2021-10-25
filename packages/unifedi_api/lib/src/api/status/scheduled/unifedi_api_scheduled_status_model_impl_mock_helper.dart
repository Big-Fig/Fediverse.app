import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import './unifedi_api_scheduled_status_model_impl.dart';
import '../../media/attachment/unifedi_api_media_attachment_model_impl_mock_helper.dart';
import 'params/unifedi_api_scheduled_status_params_model_impl_mock_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class UnifediApiScheduledStatusMockHelper {
  static UnifediApiScheduledStatus generate({
    required String seed,
  }) =>
      UnifediApiScheduledStatus(
        id: seed + 'id',
        mediaAttachments: [
          UnifediApiMediaAttachmentMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiMediaAttachmentMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        params: UnifediApiScheduledStatusParamsMockHelper.generate(
          seed: seed,
        ),
        scheduledAt: DateTimeMockHelper.generate(
          seed: seed,
        ),
      );
}
