// ignore_for_file: no-magic-number
import '../account/unifedi_api_account_model_impl_mock_helper.dart';
import '../status/unifedi_api_status_model_impl_mock_helper.dart';
import '../tag/unifedi_api_tag_model_impl_mock_helper.dart';
import 'unifedi_api_search_model_impl.dart';

class UnifediApiSearchResultMockHelper {
  static UnifediApiSearchResult generate({
    required String seed,
  }) =>
      UnifediApiSearchResult(
        accounts: [
          UnifediApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        hashtags: [
          UnifediApiTagMockHelper.generate(seed: seed + '1'),
          UnifediApiTagMockHelper.generate(seed: seed + '2'),
        ],
        statuses: [
          UnifediApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
