// ignore_for_file: no-magic-number, no-equal-arguments

import 'unifedi_api_instance_stats_model_impl.dart';

class UnifediApiInstanceStatsMockHelper {
  static UnifediApiInstanceStats generate({
    required String seed,
  }) =>
      UnifediApiInstanceStats(
        userCount: seed.hashCode + 1,
        statusCount: seed.hashCode + 2,
        domainCount: seed.hashCode + 3,
      );
}
