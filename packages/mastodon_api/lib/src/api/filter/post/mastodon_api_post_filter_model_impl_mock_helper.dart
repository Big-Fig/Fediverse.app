// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../context_type/mastodon_api_filter_context_type_model_mock_helper.dart';
import 'mastodon_api_post_filter_model_impl.dart';

// ignore_for_file: no-magic-number

class MastodonApiPostFilterMockHelper {
  static MastodonApiPostFilter generate({
    required String seed,
  }) =>
      MastodonApiPostFilter(
        context: [
          MastodonApiFilterContextTypeMockHelper.generate(
            seed: seed + '1',
          ).stringValue,
          MastodonApiFilterContextTypeMockHelper.generate(
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
