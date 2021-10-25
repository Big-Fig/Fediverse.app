import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'mastodon_api_card_type_sealed.dart';

abstract class MastodonApiCardTypeMockHelper {
  static MastodonApiCardType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiCardType.values,
      );
}
