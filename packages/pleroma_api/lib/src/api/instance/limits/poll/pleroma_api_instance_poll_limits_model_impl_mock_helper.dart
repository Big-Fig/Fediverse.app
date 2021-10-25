// ignore_for_file: no-magic-number, no-equal-arguments

import 'pleroma_api_instance_poll_limits_model_impl.dart';

class PleromaApiInstancePollLimitsLimitsMockHelper {
  static PleromaApiInstancePollLimits generate({
    required String seed,
  }) =>
      PleromaApiInstancePollLimits(
        maxExpiration: seed.hashCode + 1,
        maxOptionChars: seed.hashCode + 2,
        maxOptions: seed.hashCode + 3,
        minExpiration: seed.hashCode + 4,
      );
}
