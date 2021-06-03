import 'package:fedi/mastodon/api/markers/mastodon_api_markers_service.dart';
import 'package:fedi/pleroma/api/markers/pleroma_api_markers_model.dart';

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
