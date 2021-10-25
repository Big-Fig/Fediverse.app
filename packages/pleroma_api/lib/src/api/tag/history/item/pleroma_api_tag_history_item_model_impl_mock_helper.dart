// ignore_for_file: no-magic-number
import 'pleroma_api_tag_history_item_model_impl.dart';

class PleromaApiTagHistoryItemMockHelper {
  static PleromaApiTagHistoryItem generate({
    required String seed,
  }) =>
      PleromaApiTagHistoryItem(
        accounts: seed.hashCode + 1,
        dayInUnixTimestamp: seed.hashCode + 2,
        uses: seed.hashCode + 3,
      );
}
