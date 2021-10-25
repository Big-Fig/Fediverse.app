import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'mastodon_api_rest_error_type_sealed.dart';

abstract class MastodonApiRestErrorTypeMockHelper {
  static MastodonApiRestErrorType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiRestErrorType.values,
      );
}
