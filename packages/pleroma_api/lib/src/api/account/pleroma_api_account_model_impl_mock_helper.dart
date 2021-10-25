import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../emoji/pleroma_api_emoji_model_impl_mock_helper.dart';
import '../field/pleroma_api_field_model_impl_mock_helper.dart';
import '../id/pleroma_api_id_mock_helper.dart';
import '../tag/pleroma_api_tag_model_impl_mock_helper.dart';
import 'pleroma_api_account_model_impl.dart';
import 'relationship/pleroma_api_account_relationship_model_impl_mock_helper.dart';

abstract class PleromaApiAccountMockHelper {
  static PleromaApiAccount generate({
    required String seed,
  }) =>
      PleromaApiAccount(
        username: '${seed}username',
        url: '${seed}url',
        statusesCount: IntMockHelper.generate(seed: 'statusesCount' + seed),
        note: '${seed}note',
        locked: BoolMockHelper.generate(seed: seed + 'locked'),
        id: PleromaApiIdMockHelper.generate(seed: seed),
        headerStatic: '${seed}headerStatic',
        header: '${seed}header',
        followingCount: IntMockHelper.generate(seed: 'followingCount$seed'),
        followersCount: IntMockHelper.generate(seed: 'followersCount$seed'),
        fields: [
          PleromaApiFieldMockHelper.generate(seed: seed + '1'),
          PleromaApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        emojis: [
          PleromaApiEmojiMockHelper.generate(seed: seed + '1'),
          PleromaApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        displayName: seed + 'displayName',
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        bot: BoolMockHelper.generate(seed: seed + 'bot'),
        avatarStatic: seed + 'avatarStatic',
        avatar: seed + 'avatar',
        acct: seed + 'acct',
        pleroma: PleromaApiAccountPleromaPartMockHelper.generate(
          seed: seed,
        ),
        lastStatusAt: DateTimeMockHelper.generate(seed: seed + 'lastStatusAt'),
        fqn: seed + 'fqn',
        suspended: BoolMockHelper.generate(seed: seed + 'suspended'),
        muteExpiresAt:
            DateTimeMockHelper.generate(seed: seed + 'muteExpiresAt'),
      );
}

abstract class PleromaApiAccountPleromaPartMockHelper {
  static PleromaApiAccountPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiAccountPleromaPart(
        backgroundImage: seed + 'backgroundImage',
        tags: [
          PleromaApiTagMockHelper.generate(seed: seed + '1'),
          PleromaApiTagMockHelper.generate(seed: seed + '2'),
        ],
        relationship: PleromaApiAccountRelationshipMockHelper.generate(
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
