import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'mastodon_api_filter_context_type_model.dart';

abstract class MastodonApiFilterContextTypeMockHelper {
  static MastodonApiFilterContextType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiFilterContextType.values,
      );
}
