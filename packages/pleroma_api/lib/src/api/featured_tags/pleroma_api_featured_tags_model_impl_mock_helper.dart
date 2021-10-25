import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import '../id/pleroma_api_id_mock_helper.dart';

import 'pleroma_api_featured_tags_model_impl.dart';

class PleromaApiFeaturedTagMockHelper {
  static PleromaApiFeaturedTag generate({
    required String seed,
  }) =>
      PleromaApiFeaturedTag(
        id: PleromaApiIdMockHelper.generate(seed: seed),
        lastStatusAt: DateTimeMockHelper.generate(seed: seed + 'lastStatusAt'),
        statusesCount: IntMockHelper.generate(seed: seed + 'statusesCount'),
        name: seed + 'name',
      );
}
