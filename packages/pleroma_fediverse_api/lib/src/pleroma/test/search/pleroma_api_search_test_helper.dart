// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

import '../account/pleroma_api_account_test_helper.dart';
import '../status/pleroma_api_status_test_helper.dart';
import '../tag/pleroma_api_tag_test_helper.dart';

class PleromaApiSearchTestHelper {
  static PleromaApiSearchResult createTestPleromaApiSearchResult({
    required String seed,
  }) =>
      PleromaApiSearchResult(
        accounts: [
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
            seed: seed + '1',
          ),
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
            seed: seed + '2',
          ),
        ],
        hashtags: [
          PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + '1'),
          PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + '2'),
        ],
        statuses: [
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + '1',
          ),
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + '2',
          ),
        ],
      );
}
