import '../../../field/mastodon_api_field_model_impl_mock_helper.dart';
import 'mastodon_api_my_account_source_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

class MastodonApiMyAccountSourceMockHelper {
  static MastodonApiMyAccountSource generate({
    required String seed,
  }) =>
      MastodonApiMyAccountSource(
        followRequestsCount: seed.hashCode + 1,
        fields: [
          MastodonApiFieldMockHelper.generate(seed: seed + '1'),
          MastodonApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        note: seed + 'note',
        privacy: seed + 'privacy',
        language: seed + 'language',
        sensitive: seed.hashCode % 2 == 1,
      );
}
