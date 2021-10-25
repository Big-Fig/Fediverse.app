// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../context_type/unifedi_api_filter_context_type_model_mock_helper.dart';
import 'unifedi_api_post_filter_model_impl.dart';

// ignore_for_file: no-magic-number

class UnifediApiPostFilterMockHelper {
  static UnifediApiPostFilter generate({
    required String seed,
  }) =>
      UnifediApiPostFilter(
        context: [
          UnifediApiFilterContextTypeMockHelper.generate(
            seed: seed + '1',
          ).stringValue,
          UnifediApiFilterContextTypeMockHelper.generate(
            seed: seed + '2',
          ).stringValue,
        ],
        phrase: seed + 'phrase',
        expiresIn: DurationMockHelper.generate(
          seed: seed + 'expiresIn',
        ),
        irreversible: seed.hashCode % 2 == 0,
        wholeWord: seed.hashCode % 2 == 1,
      );
}
