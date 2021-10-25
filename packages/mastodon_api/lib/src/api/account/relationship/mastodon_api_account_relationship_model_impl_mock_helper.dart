import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../id/mastodon_api_id_mock_helper.dart';
import 'mastodon_api_account_relationship_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
abstract class MastodonApiAccountRelationshipMockHelper {
  static MastodonApiAccountRelationship generate({
    required String seed,
  }) =>
      MastodonApiAccountRelationship(
        id: MastodonApiIdMockHelper.generate(seed: '$seed id'),
        blocking: BoolMockHelper.generate(seed: '$seed blocking'),
        domainBlocking: BoolMockHelper.generate(seed: '$seed domainBlocking'),
        endorsed: BoolMockHelper.generate(seed: '$seed endorsed'),
        followedBy: BoolMockHelper.generate(seed: '$seed followedBy'),
        following: BoolMockHelper.generate(seed: '$seed following'),
        muting: BoolMockHelper.generate(seed: '$seed muting'),
        mutingNotifications: BoolMockHelper.generate(
          seed: '$seed mutingNotifications',
        ),
        requested: BoolMockHelper.generate(seed: '$seed requested'),
        showingReblogs: BoolMockHelper.generate(seed: '$seed showingReblogs'),
        blockedBy: BoolMockHelper.generate(seed: '$seed blockedBy'),
        notifying: BoolMockHelper.generate(seed: '$seed notifying'),
        note: '$seed note',
      );
}
