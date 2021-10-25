import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../service/pleroma_api_service.dart';

import '../../../pleroma_api_marker_model.dart';

abstract class IPleromaApiMarkerUserAccessService
    implements IPleromaApiService {
  IPleromaApiFeature get getMarkersFeature;

  Future<Map<String, IPleromaApiMarker>> getMarkers({
    required List<String> timelines,
  });

  IPleromaApiFeature get updateMarkersFeature;

  Future<Map<String, IPleromaApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  });
}
