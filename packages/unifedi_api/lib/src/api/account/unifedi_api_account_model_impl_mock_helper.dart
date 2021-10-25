import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../emoji/unifedi_api_emoji_model_impl_mock_helper.dart';
import '../field/unifedi_api_field_model_impl_mock_helper.dart';
import '../tag/unifedi_api_tag_model_impl_mock_helper.dart';
import 'relationship/unifedi_api_account_relationship_model_impl_mock_helper.dart';
import 'unifedi_api_account_model_impl.dart';

abstract class UnifediApiAccountMockHelper {
  // ignore: long-method
  static UnifediApiAccount generate({
    required String seed,
  }) =>
      UnifediApiAccount(
        username: '${seed}username',
        url: '${seed}url',
        statusesCount: IntMockHelper.generate(seed: 'statusesCount' + seed),
        note: '${seed}note',
        locked: BoolMockHelper.generate(seed: seed + 'locked'),
        id: seed + 'id',
        headerStatic: '${seed}headerStatic',
        header: '${seed}header',
        followingCount: IntMockHelper.generate(seed: 'followingCount$seed'),
        followersCount: IntMockHelper.generate(seed: 'followersCount$seed'),
        fields: [
          UnifediApiFieldMockHelper.generate(seed: seed + '1'),
          UnifediApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        emojis: [
          UnifediApiEmojiMockHelper.generate(seed: seed + '1'),
          UnifediApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        displayName: seed + 'displayName',
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        bot: BoolMockHelper.generate(seed: seed + 'bot'),
        avatarStatic: seed + 'avatarStatic',
        avatar: seed + 'avatar',
        acct: seed + 'acct',
        lastStatusAt: DateTimeMockHelper.generate(seed: seed + 'lastStatusAt'),
        fqn: seed + 'fqn',
        suspended: BoolMockHelper.generate(seed: seed + 'suspended'),
        muteExpiresAt:
            DateTimeMockHelper.generate(seed: seed + 'muteExpiresAt'),
        backgroundImage: seed + 'backgroundImage',
        tags: [
          UnifediApiTagMockHelper.generate(seed: seed + '1'),
          UnifediApiTagMockHelper.generate(seed: seed + '2'),
        ],
        relationship: UnifediApiAccountRelationshipMockHelper.generate(
          seed: seed + 'relationship',
        ),
        isAdmin: BoolMockHelper.generate(seed: seed + 'isAdmin'),
        isModerator: BoolMockHelper.generate(seed: seed + 'isModerator'),
        confirmationPending:
            BoolMockHelper.generate(seed: seed + 'confirmationPending'),
        hideFavorites: BoolMockHelper.generate(seed: seed + 'hideFavorites'),
        hideFollowers: BoolMockHelper.generate(seed: seed + 'hideFollowers'),
        hideFollows: BoolMockHelper.generate(seed: seed + 'hideFollows'),
        hideFollowersCount:
            BoolMockHelper.generate(seed: seed + 'hideFollowersCount'),
        hideFollowsCount:
            BoolMockHelper.generate(seed: seed + 'hideFollowsCount'),
        deactivated: BoolMockHelper.generate(seed: seed + 'deactivated'),
        allowFollowingMove:
            BoolMockHelper.generate(seed: seed + 'allowFollowingMove'),
        skipThreadContainment:
            BoolMockHelper.generate(seed: seed + 'skipThreadContainment'),
        acceptsChatMessages:
            BoolMockHelper.generate(seed: seed + 'acceptsChatMessages'),
        isConfirmed: BoolMockHelper.generate(seed: seed + 'isConfirmed'),
        favicon: seed + 'favicon',
        apId: seed + 'apId',
        alsoKnownAs: [
          seed + 'known1',
          seed + 'known2',
        ],
      );
}
