// ignore_for_file: no-magic-number
import '../account/mastodon_api_account_model_impl_mock_helper.dart';
import '../status/mastodon_api_status_model_impl_mock_helper.dart';
import '../tag/mastodon_api_tag_model_impl_mock_helper.dart';
import 'mastodon_api_search_model_impl.dart';

class MastodonApiSearchResultMockHelper {
  static MastodonApiSearchResult generate({
    required String seed,
  }) =>
      MastodonApiSearchResult(
        accounts: [
          MastodonApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          MastodonApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        hashtags: [
          MastodonApiTagMockHelper.generate(seed: seed + '1'),
          MastodonApiTagMockHelper.generate(seed: seed + '2'),
        ],
        statuses: [
          MastodonApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          MastodonApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
