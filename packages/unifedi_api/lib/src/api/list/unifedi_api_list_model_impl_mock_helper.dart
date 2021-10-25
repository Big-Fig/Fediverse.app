// ignore_for_file: no-magic-number
import 'replies_policy_type/unifedi_api_card_replies_policy_type_sealed_mock_helper.dart';
import 'unifedi_api_list_model_impl.dart';

class UnifediApiListMockHelper {
  static UnifediApiList generate({
    required String seed,
  }) =>
      UnifediApiList(
        title: seed + 'title',
        id: seed + 'id',
        repliesPolicy: UnifediApiListRepliesPolicyTypeMockHelper.generate(
          seed: seed + 'repliesPolicy',
        ).stringValue,
      );
}
