import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'mastodon_api_search_request_type_sealed.dart';

abstract class MastodonApiSearchRequestTypeMockHelper {
  static MastodonApiSearchRequestType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiSearchRequestType.values,
      );
}
