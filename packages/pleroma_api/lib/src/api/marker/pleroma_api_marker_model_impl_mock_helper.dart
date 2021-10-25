// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_marker_model_impl.dart';

class PleromaApiMarkerMockHelper {
  static PleromaApiMarker generate({
    required String seed,
  }) =>
      PleromaApiMarker(
        lastReadId: seed + 'lastReadId',
        version: IntMockHelper.generate(seed: seed + 'version'),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        pleroma: PleromaApiMarkerPleromaPartMockHelper.generate(
          seed: seed + 'pleroma',
        ),
      );
}

class PleromaApiMarkerPleromaPartMockHelper {
  static PleromaApiMarkerPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiMarkerPleromaPart(
        unreadCount: IntMockHelper.generate(
          seed: seed + 'unreadCount',
        ),
      );
}
