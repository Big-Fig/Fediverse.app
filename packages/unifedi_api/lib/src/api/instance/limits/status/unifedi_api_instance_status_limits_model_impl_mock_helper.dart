// ignore_for_file: no-magic-number, no-equal-arguments

import 'unifedi_api_instance_status_limits_model_impl.dart';

class UnifediApiInstanceStatusLimitsMockHelper {
  static UnifediApiInstanceStatusLimits generate({
    required String seed,
  }) =>
      UnifediApiInstanceStatusLimits(
        maxTootChars: seed.hashCode + 1,
        maxMediaAttachmentsCount: seed.hashCode + 1,
      );
}
