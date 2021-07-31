import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/markers/mastodon_api_markers_model.dart';

abstract class IMastodonApiMarkersService implements IDisposable {
  Future<Map<String, IMastodonApiMarker>> getMarkers({
    required List<String> timelines,
  });

  Future<Map<String, IMastodonApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  });
}
