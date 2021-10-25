// ignore_for_file: no-magic-number
import 'mastodon_api_tag_history_item_model_impl.dart';

class MastodonApiTagHistoryItemMockHelper {
  static MastodonApiTagHistoryItem generate({
    required String seed,
  }) =>
      MastodonApiTagHistoryItem(
        accounts: seed.hashCode + 1,
        dayInUnixTimestamp: seed.hashCode + 2,
        uses: seed.hashCode + 3,
      );
}
