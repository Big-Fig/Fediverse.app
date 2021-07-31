import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/markers/pleroma_api_markers_model.dart';

abstract class IPleromaApiMarkersService implements IMastodonApiMarkersService {
  @override
  Future<Map<String, IPleromaApiMarker>> getMarkers({
    required List<String> timelines,
  });

  @override
  Future<Map<String, IPleromaApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  });
}
