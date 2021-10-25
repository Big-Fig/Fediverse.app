import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'unifedi_api_rest_error_type_sealed.dart';

abstract class UnifediApiRestErrorTypeMockHelper {
  static UnifediApiRestErrorType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiRestErrorType.values,
      );
}
