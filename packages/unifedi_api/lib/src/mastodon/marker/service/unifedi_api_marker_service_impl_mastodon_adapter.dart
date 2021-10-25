import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/marker/service/unifedi_api_marker_service.dart';
import '../../../api/marker/unifedi_api_marker_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_marker_model_mastodon_adapter.dart';

class UnifediApiMarkerServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiMarkerService {
  final IMastodonApiMarkerUserAccessService mastodonApiMarkerUserAccessService;

  UnifediApiMarkerServiceMastodonAdapter({
    required this.mastodonApiMarkerUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiMarkerUserAccessService.restService,
      );

  @override
  Future<Map<String, IUnifediApiMarker>> getMarkers({
    required List<String> timelines,
  }) =>
      mastodonApiMarkerUserAccessService
          .getMarkers(
            timelines: timelines,
          )
          .then(
            (map) => map.map(
              (key, value) => MapEntry(
                key,
                value.toUnifediApiMarkerMastodonAdapter(),
              ),
            ),
          );

  @override
  IUnifediApiFeature get getMarkersFeature =>
      mastodonApiMarkerUserAccessService.getMarkersFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<Map<String, IUnifediApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  }) =>
      mastodonApiMarkerUserAccessService
          .updateMarkers(
            timelinesLastReadIds: timelinesLastReadIds,
          )
          .then(
            (map) => map.map(
              (key, value) => MapEntry(
                key,
                value.toUnifediApiMarkerMastodonAdapter(),
              ),
            ),
          );

  @override
  IUnifediApiFeature get updateMarkersFeature =>
      mastodonApiMarkerUserAccessService.updateMarkersFeature
          .toUnifediApiFeatureMastodonAdapter();
}
