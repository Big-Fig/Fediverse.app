// ignore_for_file: no-magic-number
import 'item/unifedi_api_tag_history_item_model_impl_mock_helper.dart';
import 'unifedi_api_tag_history_model_impl.dart';

class UnifediApiTagHistoryMockHelper {
  static UnifediApiTagHistory generate({
    required String seed,
  }) =>
      UnifediApiTagHistory(
        items: [
          UnifediApiTagHistoryItemMockHelper.generate(seed: seed + '1'),
          UnifediApiTagHistoryItemMockHelper.generate(seed: seed + '2'),
        ],
      );
}
