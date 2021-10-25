import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_visibility_sealed.dart';

abstract class PleromaApiVisibilityMockHelper {
  static PleromaApiVisibility generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiVisibility.values,
      );
}
