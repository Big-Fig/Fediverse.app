import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_account_relationship_follow_update_state_sealed.dart';

abstract class UnifediApiAccountRelationshipFollowUpdateStateMockHelper {
  static UnifediApiAccountRelationshipFollowUpdateState generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiAccountRelationshipFollowUpdateState.values,
      );
}
