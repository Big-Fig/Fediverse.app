// ignore_for_file: no-magic-number
import 'mastodon_api_poll_option_model_impl.dart';

// ignore_for_file: no-equal-arguments

class MastodonApiPollOptionMockHelper {
  static MastodonApiPollOption generate({
    required String seed,
  }) =>
      MastodonApiPollOption(
        title: seed + 'title',
        votesCount: seed.hashCode % 5,
      );
}
