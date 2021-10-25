// ignore_for_file: no-magic-number
import 'pleroma_api_list_model_impl.dart';
import 'replies_policy_type/pleroma_api_card_replies_policy_type_sealed_mock_helper.dart';

class PleromaApiListMockHelper {
  static PleromaApiList generate({
    required String seed,
  }) =>
      PleromaApiList(
        title: seed + 'title',
        id: seed + 'id',
        repliesPolicy: PleromaApiListRepliesPolicyTypeMockHelper.generate(
          seed: seed + 'repliesPolicy',
        ).stringValue,
      );
}
