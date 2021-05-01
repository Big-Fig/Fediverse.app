import 'package:fedi/pleroma/api/status/context/pleroma_api_status_context_model.dart';

import '../pleroma_api_status_test_helper.dart';

// ignore_for_file: no-magic-number
class PleromaApiStatusContextTestHelper {
  static PleromaApiStatusContext createTestPleromaApiStatusContext({
    required String seed,
  }) =>
      PleromaApiStatusContext(
        ancestors: [
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + "1",
          ),
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + "2",
          ),
        ],
        descendants: [
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + "3",
          ),
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + "4",
          ),
        ],
      );
}
