import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_rest_error_type_sealed.dart';

abstract class PleromaApiRestErrorTypeMockHelper {
  static PleromaApiRestErrorType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiRestErrorType.values,
      );
}
