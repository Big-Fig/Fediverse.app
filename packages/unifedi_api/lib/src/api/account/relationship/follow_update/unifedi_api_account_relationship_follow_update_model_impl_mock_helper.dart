import 'item/unifedi_api_account_relationship_follow_update_item_model_impl_mock_helper.dart';
import 'state/unifedi_api_account_relationship_follow_update_state_sealed_mock_helper.dart';
import 'unifedi_api_account_relationship_follow_update_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
abstract class UnifediApiAccountRelationshipFollowUpdateMockHelper {
  static UnifediApiAccountRelationshipFollowUpdate generate({
    required String seed,
  }) =>
      UnifediApiAccountRelationshipFollowUpdate(
        state:
            UnifediApiAccountRelationshipFollowUpdateStateMockHelper.generate(
          seed: seed + 'state',
        ).stringValue,
        follower:
            UnifediApiAccountRelationshipFollowUpdateItemMockHelper.generate(
          seed: seed + 'follower',
        ),
        following:
            UnifediApiAccountRelationshipFollowUpdateItemMockHelper.generate(
          seed: seed + 'following',
        ),
      );
}
