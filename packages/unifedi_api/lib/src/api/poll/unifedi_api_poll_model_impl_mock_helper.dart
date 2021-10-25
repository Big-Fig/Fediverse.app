// ignore_for_file: no-magic-number
import 'option/unifedi_api_poll_option_model_impl_mock_helper.dart';
import 'unifedi_api_poll_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPollMockHelper {
  static UnifediApiPoll generate({
    required String seed,
  }) =>
      UnifediApiPoll(
        expired: seed.hashCode % 2 == 0,
        expiresAt: DateTime(2000 + seed.hashCode % 20),
        id: seed + 'id',
        multiple: seed.hashCode % 2 == 0,
        options: [
          UnifediApiPollOptionMockHelper.generate(seed: seed + '1'),
          UnifediApiPollOptionMockHelper.generate(seed: seed + '2'),
        ],
        ownVotes: [
          seed.hashCode % 7,
          seed.hashCode % 13,
        ],
        voted: seed.hashCode % 2 == 1,
        votersCount: seed.hashCode % 5,
        votesCount: seed.hashCode % 3,
      );
}
