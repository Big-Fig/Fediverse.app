// ignore_for_file: no-magic-number, no-equal-arguments
import 'unifedi_api_instance_field_limits_model_impl.dart';

class UnifediApiInstanceFieldLimitsMockHelper {
  static UnifediApiInstanceFieldLimits generate({
    required String seed,
  }) =>
      UnifediApiInstanceFieldLimits(
        maxFields: seed.hashCode + 1,
        maxRemoteFields: seed.hashCode + 2,
        nameLength: seed.hashCode + 3,
        valueLength: seed.hashCode + 4,
      );
}
