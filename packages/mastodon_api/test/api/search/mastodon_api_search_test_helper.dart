// ignore_for_file: no-magic-number
import 'package:mastodon_api/mastodon_api.dart';

class MastodonApiSearchTestHelper {
  static MastodonApiSearchRequestType createTestPleromaApiVisibility({
    required String seed,
  }) =>
      MastodonApiSearchRequestType
          .values[seed.hashCode % MastodonApiSearchRequestType.values.length];
}
