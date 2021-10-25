// ignore_for_file: no-magic-number
import 'unifedi_api_tag_history_item_model_impl.dart';

class UnifediApiTagHistoryItemMockHelper {
  static UnifediApiTagHistoryItem generate({
    required String seed,
  }) =>
      UnifediApiTagHistoryItem(
        accounts: seed.hashCode + 1,
        dayInUnixTimestamp: seed.hashCode + 2,
        uses: seed.hashCode + 3,
      );
}
