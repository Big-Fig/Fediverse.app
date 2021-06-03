// ignore_for_file: no-magic-number
import 'package:fedi/mastodon/api/search/mastodon_api_search_model.dart';

class MastodonApiSearchTestHelper {
  static MastodonApiSearchRequestType createTestPleromaApiVisibility({
    required String seed,
  }) =>
      MastodonApiSearchRequestType
          .values[seed.hashCode % MastodonApiSearchRequestType.values.length];
}
