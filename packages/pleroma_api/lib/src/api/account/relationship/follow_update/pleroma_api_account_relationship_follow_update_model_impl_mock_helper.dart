import 'item/pleroma_api_account_relationship_follow_update_item_model_impl_mock_helper.dart';
import 'pleroma_api_account_relationship_follow_update_model_impl.dart';
import 'state/pleroma_api_account_relationship_follow_update_state_sealed_mock_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
abstract class PleromaApiAccountRelationshipFollowUpdateMockHelper {
  static PleromaApiAccountRelationshipFollowUpdate generate({
    required String seed,
  }) =>
      PleromaApiAccountRelationshipFollowUpdate(
        state:
            PleromaApiAccountRelationshipFollowUpdateStateMockHelper.generate(
          seed: seed + 'state',
        ).stringValue,
        follower:
            PleromaApiAccountRelationshipFollowUpdateItemMockHelper.generate(
          seed: seed + 'follower',
        ),
        following:
            PleromaApiAccountRelationshipFollowUpdateItemMockHelper.generate(
          seed: seed + 'following',
        ),
      );
}
