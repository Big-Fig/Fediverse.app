import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_post_status_poll_model_impl.dart';

abstract class UnifediApiPostStatusPollMockHelper {
  static UnifediApiPostStatusPoll generate({
    required String seed,
  }) =>
      UnifediApiPostStatusPoll(
        expiresInSeconds: DurationMockHelper.generate(seed: seed).inSeconds,
        hideTotals: BoolMockHelper.generate(seed: seed + 'hideTotals'),
        multiple: BoolMockHelper.generate(seed: seed + 'multiple'),
        options: [
          seed + '1',
          seed + '2',
        ],
      );
}
