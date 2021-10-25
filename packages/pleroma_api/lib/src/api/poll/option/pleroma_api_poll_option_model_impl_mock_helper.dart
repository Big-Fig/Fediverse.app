// ignore_for_file: no-magic-number
import 'pleroma_api_poll_option_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPollOptionMockHelper {
  static PleromaApiPollOption generate({
    required String seed,
  }) =>
      PleromaApiPollOption(
        title: seed + 'title',
        votesCount: seed.hashCode % 5,
      );
}
