import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';

// ignore_for_file: no-magic-number
class PostStatusModelMockHelper {
  static PostStatusPoll createTestPostStatusPoll({
    required String seed,
  }) =>
      PostStatusPoll(
        durationLength: Duration(seconds: seed.hashCode % 60),
        hideTotals: seed.hashCode % 2 == 0,
        multiple: seed.hashCode % 2 == 1,
        options: [
          seed + 'option1',
          seed + 'option2',
        ],
      );
}
