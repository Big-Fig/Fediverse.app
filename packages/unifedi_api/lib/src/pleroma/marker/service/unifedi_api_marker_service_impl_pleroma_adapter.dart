import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/marker/service/unifedi_api_marker_service.dart';
import '../../../api/marker/unifedi_api_marker_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../unifedi_api_marker_model_pleroma_adapter.dart';

class UnifediApiMarkerServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiMarkerService {
  final IPleromaApiMarkerUserAccessService pleromaApiMarkerUserAccessService;

  UnifediApiMarkerServicePleromaAdapter({
    required this.pleromaApiMarkerUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiMarkerUserAccessService.restService,
      );

  @override
  Future<Map<String, IUnifediApiMarker>> getMarkers({
    required List<String> timelines,
  }) =>
      pleromaApiMarkerUserAccessService
          .getMarkers(
            timelines: timelines,
          )
          .then(
            (map) => map.map(
              (key, value) => MapEntry(
                key,
                value.toUnifediApiMarkerPleromaAdapter(),
              ),
            ),
          );

  @override
  IUnifediApiFeature get getMarkersFeature =>
      pleromaApiMarkerUserAccessService.getMarkersFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<Map<String, IUnifediApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  }) =>
      pleromaApiMarkerUserAccessService
          .updateMarkers(
            timelinesLastReadIds: timelinesLastReadIds,
          )
          .then(
            (map) => map.map(
              (key, value) => MapEntry(
                key,
                value.toUnifediApiMarkerPleromaAdapter(),
              ),
            ),
          );

  @override
  IUnifediApiFeature get updateMarkersFeature =>
      pleromaApiMarkerUserAccessService.updateMarkersFeature
          .toUnifediApiFeaturePleromaAdapter();
}
