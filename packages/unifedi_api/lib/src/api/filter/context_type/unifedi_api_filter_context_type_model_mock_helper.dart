import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_filter_context_type_model.dart';

abstract class UnifediApiFilterContextTypeMockHelper {
  static UnifediApiFilterContextType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiFilterContextType.values,
      );
}
