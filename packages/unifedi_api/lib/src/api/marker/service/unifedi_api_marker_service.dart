import '../../feature/unifedi_api_feature_model.dart';
import '../../unifedi_api_service.dart';
import '../unifedi_api_marker_model.dart';

abstract class IUnifediApiMarkerService implements IUnifediApiService {
  IUnifediApiFeature get getMarkersFeature;

  Future<Map<String, IUnifediApiMarker>> getMarkers({
    required List<String> timelines,
  });

  IUnifediApiFeature get updateMarkersFeature;

  Future<Map<String, IUnifediApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  });
}
