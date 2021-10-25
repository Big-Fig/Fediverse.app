import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../emoji/mastodon_api_emoji_model_impl_mock_helper.dart';
import '../../field/mastodon_api_field_model_impl_mock_helper.dart';
import 'mastodon_api_my_account_model_impl.dart';
import 'source/mastodon_api_my_account_source_model_impl_mock_helper.dart';
// ignore_for_file: no-magic-number, no-equal-arguments

class MastodonApiMyAccountMockHelper {
  static MastodonApiMyAccount generate({
    required String seed,
  }) =>
      MastodonApiMyAccount(
        username: seed + 'username',
        url: seed + 'url',
        statusesCount: seed.hashCode + 1,
        note: seed + 'note',
        locked: seed.hashCode % 2 == 0,
        id: seed + 'id',
        headerStatic: seed + 'headerStatic',
        header: seed + 'header',
        followingCount: seed.hashCode + 2,
        followersCount: seed.hashCode + 3,
        fields: [
          MastodonApiFieldMockHelper.generate(seed: seed + '1'),
          MastodonApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        emojis: [
          MastodonApiEmojiMockHelper.generate(seed: seed + '1'),
          MastodonApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        displayName: seed + 'displayName',
        createdAt: DateTime(seed.hashCode % 2000),
        bot: seed.hashCode % 2 == 1,
        avatarStatic: seed + 'avatarStatic',
        avatar: seed + 'avatar',
        acct: seed + 'acct',
        lastStatusAt: DateTime(seed.hashCode % 2000 + 1),
        source: MastodonApiMyAccountSourceMockHelper.generate(
          seed: seed,
        ),
        discoverable: seed.hashCode % 2 == 0,
        suspended: BoolMockHelper.generate(seed: seed + 'suspended'),
        muteExpiresAt:
            DateTimeMockHelper.generate(seed: seed + 'muteExpiresAt'),
      );
}
