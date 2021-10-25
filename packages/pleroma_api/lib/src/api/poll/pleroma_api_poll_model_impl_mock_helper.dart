// ignore_for_file: no-magic-number
import 'option/pleroma_api_poll_option_model_impl_mock_helper.dart';
import 'pleroma_api_poll_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPollMockHelper {
  static PleromaApiPoll generate({
    required String seed,
  }) =>
      PleromaApiPoll(
        expired: seed.hashCode % 2 == 0,
        expiresAt: DateTime(2000 + seed.hashCode % 20),
        id: seed + 'id',
        multiple: seed.hashCode % 2 == 0,
        options: [
          PleromaApiPollOptionMockHelper.generate(seed: seed + '1'),
          PleromaApiPollOptionMockHelper.generate(seed: seed + '2'),
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
