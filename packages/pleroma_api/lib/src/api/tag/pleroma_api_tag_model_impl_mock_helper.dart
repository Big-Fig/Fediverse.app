import 'history/item/pleroma_api_tag_history_item_model_impl_mock_helper.dart';
import 'pleroma_api_tag_model_impl.dart';

// ignore_for_file: no-magic-number
class PleromaApiTagMockHelper {
  static PleromaApiTag generate({
    required String seed,
  }) =>
      PleromaApiTag(
        name: seed,
        url: 'https://fedi.app/#$seed',
        history: [
          PleromaApiTagHistoryItemMockHelper.generate(seed: seed + '1'),
          PleromaApiTagHistoryItemMockHelper.generate(seed: seed + '2'),
        ],
      );
}
