// ignore_for_file: no-magic-number, no-equal-arguments
import 'pleroma_api_instance_field_limits_model_impl.dart';

class PleromaApiInstanceFieldLimitsMockHelper {
  static PleromaApiInstanceFieldLimits generate({
    required String seed,
  }) =>
      PleromaApiInstanceFieldLimits(
        maxFields: seed.hashCode + 1,
        maxRemoteFields: seed.hashCode + 2,
        nameLength: seed.hashCode + 3,
        valueLength: seed.hashCode + 4,
      );
}
