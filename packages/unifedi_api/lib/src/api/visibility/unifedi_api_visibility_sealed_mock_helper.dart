import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_visibility_sealed.dart';

abstract class UnifediApiVisibilityMockHelper {
  static UnifediApiVisibility generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiVisibility.values,
      );
}
