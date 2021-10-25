import '../../../field/mastodon_api_field_model_impl_mock_helper.dart';
import 'mastodon_api_edit_my_account_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

class MastodonApiEditMyAccountMockHelper {
  static MastodonApiEditMyAccount generate({
    required String seed,
  }) =>
      MastodonApiEditMyAccount(
        fieldsAttributes: [
          MastodonApiFieldMockHelper.generate(seed: seed + '1'),
          MastodonApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        discoverable: seed.hashCode % 2 == 0,
        bot: seed.hashCode % 2 == 1,
        displayName: seed + 'displayName',
        note: seed + 'note',
        locked: seed.hashCode % 2 == 0,
        privacy: seed + 'privacy',
        sensitive: seed.hashCode % 2 == 1,
        language: seed + 'language',
        avatarLocalFilePath: seed + 'avatarLocalFilePath',
        deleteAvatar: null,
        headerLocalFilePath: seed + 'headerLocalFilePath',
        deleteHeader: null,
      );
}
