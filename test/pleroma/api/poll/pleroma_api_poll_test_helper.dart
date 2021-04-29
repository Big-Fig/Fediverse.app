// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';

class PleromaApiPollTestHelper {
  static PleromaApiPollOption createTestPleromaApiPollOption({
    required String seed,
  }) =>
      PleromaApiPollOption(
        title: seed + "title",
        votesCount: seed.hashCode % 5,
      );

  static PleromaApiPoll createTestPleromaPoll({
    required String seed,
  }) =>
      PleromaApiPoll(
        expired: seed.hashCode % 2 == 0,
        expiresAt: DateTime(2000 + seed.hashCode % 20),
        id: seed + "id",
        multiple: seed.hashCode % 2 == 0,
        options: [
          createTestPleromaApiPollOption(seed: seed + "1"),
          createTestPleromaApiPollOption(seed: seed + "2"),
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
