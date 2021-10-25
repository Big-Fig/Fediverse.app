import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'type/unifedi_api_access_level_type_sealed.dart';
import 'unifedi_api_access_level_model_impl.dart';

class UnifediApiAccessLevelMockHelper {
  static UnifediApiAccessLevel generate({
    required String seed,
  }) =>
      UnifediApiAccessLevel(
        stringValue: EnumMockHelper.generate(
          seed: seed,
          values: UnifediApiAccessLevelType.values,
        ).stringValue,
      );
}
