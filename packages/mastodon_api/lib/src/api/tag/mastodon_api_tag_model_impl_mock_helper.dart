import 'history/item/mastodon_api_tag_history_item_model_impl_mock_helper.dart';
import 'mastodon_api_tag_model_impl.dart';

// ignore_for_file: no-magic-number
class MastodonApiTagMockHelper {
  static MastodonApiTag generate({
    required String seed,
  }) =>
      MastodonApiTag(
        name: seed,
        url: 'https://fedi.app/#$seed',
        history: [
          MastodonApiTagHistoryItemMockHelper.generate(seed: seed + '1'),
          MastodonApiTagHistoryItemMockHelper.generate(seed: seed + '2'),
        ],
      );
}
