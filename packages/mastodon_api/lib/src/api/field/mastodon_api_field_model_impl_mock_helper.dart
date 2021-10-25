import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'mastodon_api_field_model_impl.dart';

class MastodonApiFieldMockHelper {
  static MastodonApiField generate({
    required String seed,
  }) =>
      MastodonApiField(
        name: seed + 'name',
        value: seed + 'value',
        // ignore: no-magic-number
        verifiedAt: DateTimeMockHelper.generate(seed: seed + 'verifiedAt'),
      );
}
