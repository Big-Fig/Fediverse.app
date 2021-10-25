import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_post_status_poll_model_impl.dart';

abstract class PleromaApiPostStatusPollMockHelper {
  static PleromaApiPostStatusPoll generate({
    required String seed,
  }) =>
      PleromaApiPostStatusPoll(
        expiresInSeconds: DurationMockHelper.generate(seed: seed).inSeconds,
        hideTotals: BoolMockHelper.generate(seed: seed + 'hideTotals'),
        multiple: BoolMockHelper.generate(seed: seed + 'multiple'),
        options: [
          seed + '1',
          seed + '2',
        ],
      );
}
