// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'context_type/pleroma_api_filter_context_type_model_mock_helper.dart';
import 'pleroma_api_filter_model_impl.dart';

class PleromaApiFilterMockHelper {
  static PleromaApiFilter generate({
    required String seed,
  }) =>
      PleromaApiFilter(
        context: [
          PleromaApiFilterContextTypeMockHelper.generate(
            seed: seed + '1',
          ).stringValue,
          PleromaApiFilterContextTypeMockHelper.generate(
            seed: seed + '2',
          ).stringValue,
        ],
        phrase: seed + 'phrase',
        expiresAt: DateTimeMockHelper.generate(
          seed: seed + 'expiresAt',
        ),
        id: seed + 'id',
        irreversible: seed.hashCode % 2 == 0,
        wholeWord: seed.hashCode % 2 == 1,
      );
}
