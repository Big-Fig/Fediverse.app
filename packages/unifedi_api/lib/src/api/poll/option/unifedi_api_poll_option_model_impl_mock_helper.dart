// ignore_for_file: no-magic-number
import 'unifedi_api_poll_option_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPollOptionMockHelper {
  static UnifediApiPollOption generate({
    required String seed,
  }) =>
      UnifediApiPollOption(
        title: seed + 'title',
        votesCount: seed.hashCode % 5,
      );
}
