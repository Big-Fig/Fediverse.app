// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'unifedi_api_marker_model_impl.dart';

class UnifediApiMarkerMockHelper {
  static UnifediApiMarker generate({
    required String seed,
  }) =>
      UnifediApiMarker(
        lastReadId: seed + 'lastReadId',
        version: IntMockHelper.generate(seed: seed + 'version'),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        unreadCount: IntMockHelper.generate(
          seed: seed + 'unreadCount',
        ),
      );
}
