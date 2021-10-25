// ignore_for_file: no-magic-number
import '../account/pleroma_api_account_model_impl_mock_helper.dart';
import '../status/pleroma_api_status_model_impl_mock_helper.dart';
import '../tag/pleroma_api_tag_model_impl_mock_helper.dart';
import 'pleroma_api_search_model_impl.dart';

class PleromaApiSearchResultMockHelper {
  static PleromaApiSearchResult generate({
    required String seed,
  }) =>
      PleromaApiSearchResult(
        accounts: [
          PleromaApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        hashtags: [
          PleromaApiTagMockHelper.generate(seed: seed + '1'),
          PleromaApiTagMockHelper.generate(seed: seed + '2'),
        ],
        statuses: [
          PleromaApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
