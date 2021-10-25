import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'unifedi_api_card_replies_policy_type_sealed.dart';

abstract class UnifediApiListRepliesPolicyTypeMockHelper {
  static UnifediApiListRepliesPolicyType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiListRepliesPolicyType.values,
      );
}
