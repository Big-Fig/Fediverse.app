import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'history/unifedi_api_tag_history_model_impl_mock_helper.dart';
import 'unifedi_api_tag_model_impl.dart';

// ignore_for_file: no-magic-number
class UnifediApiTagMockHelper {
  static UnifediApiTag generate({
    required String seed,
  }) =>
      UnifediApiTag(
        name: seed,
        url: 'https://fedi.app/#$seed',
        history:
            UnifediApiTagHistoryMockHelper.generate(seed: seed + 'history,'),
        id: seed + 'id',
        lastStatusAt: DateTimeMockHelper.generate(seed: seed + 'lastStatusAt'),
        statusesCount: IntMockHelper.generate(
          seed: seed + 'statusesCount',
        ),
      );
}
