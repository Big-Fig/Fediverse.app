import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../service/mastodon_api_service.dart';

import '../../../mastodon_api_marker_model.dart';

abstract class IMastodonApiMarkerUserAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get getMarkersFeature;

  Future<Map<String, IMastodonApiMarker>> getMarkers({
    required List<String> timelines,
  });

  IMastodonApiFeature get updateMarkersFeature;

  Future<Map<String, IMastodonApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  });
}
