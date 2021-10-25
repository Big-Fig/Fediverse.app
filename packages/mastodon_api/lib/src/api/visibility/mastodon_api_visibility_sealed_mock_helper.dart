import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'mastodon_api_visibility_sealed.dart';

abstract class MastodonApiVisibilityMockHelper {
  static MastodonApiVisibility generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiVisibility.values,
      );
}
