import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../emoji/mastodon_api_emoji_model_impl_mock_helper.dart';
import '../field/mastodon_api_field_model_impl_mock_helper.dart';
import '../id/mastodon_api_id_mock_helper.dart';
import 'mastodon_api_account_model_impl.dart';

abstract class MastodonApiAccountMockHelper {
  static MastodonApiAccount generate({
    required String seed,
  }) =>
      MastodonApiAccount(
        username: '${seed}username',
        url: '${seed}url',
        statusesCount: IntMockHelper.generate(seed: 'statusesCount' + seed),
        note: '${seed}note',
        locked: BoolMockHelper.generate(seed: seed + 'locked'),
        id: MastodonApiIdMockHelper.generate(seed: seed),
        headerStatic: '${seed}headerStatic',
        header: '${seed}header',
        followingCount: IntMockHelper.generate(seed: 'followingCount$seed'),
        followersCount: IntMockHelper.generate(seed: 'followersCount$seed'),
        fields: [
          MastodonApiFieldMockHelper.generate(seed: seed + '1'),
          MastodonApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        emojis: [
          MastodonApiEmojiMockHelper.generate(seed: seed + '1'),
          MastodonApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        displayName: seed + 'displayName',
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        bot: BoolMockHelper.generate(seed: seed + 'bot'),
        avatarStatic: seed + 'avatarStatic',
        avatar: seed + 'avatar',
        acct: seed + 'acct',
        lastStatusAt: DateTimeMockHelper.generate(seed: seed + 'lastStatusAt'),
        suspended: BoolMockHelper.generate(seed: seed + 'suspended'),
        muteExpiresAt:
            DateTimeMockHelper.generate(seed: seed + 'muteExpiresAt'),
      );
}
