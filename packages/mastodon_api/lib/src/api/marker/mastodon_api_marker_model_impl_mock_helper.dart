// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'mastodon_api_marker_model_impl.dart';

class MastodonApiMarkerMockHelper {
  static MastodonApiMarker generate({
    required String seed,
  }) =>
      MastodonApiMarker(
        lastReadId: seed + 'lastReadId',
        version: IntMockHelper.generate(seed: seed + 'version'),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
      );
}
