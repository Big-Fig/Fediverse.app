import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import '../id/mastodon_api_id_mock_helper.dart';

import 'mastodon_api_featured_tags_model_impl.dart';

class MastodonApiFeaturedTagMockHelper {
  static MastodonApiFeaturedTag generate({
    required String seed,
  }) =>
      MastodonApiFeaturedTag(
        id: MastodonApiIdMockHelper.generate(seed: seed),
        lastStatusAt: DateTimeMockHelper.generate(seed: seed + 'lastStatusAt'),
        statusesCount: IntMockHelper.generate(seed: seed + 'statusesCount'),
        name: seed + 'name',
      );
}
