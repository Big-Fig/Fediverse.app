import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_account_relationship_follow_update_state_sealed.dart';

abstract class PleromaApiAccountRelationshipFollowUpdateStateMockHelper {
  static PleromaApiAccountRelationshipFollowUpdateState generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiAccountRelationshipFollowUpdateState.values,
      );
}
