import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../pleroma_api_marker_model.dart';
import '../../../pleroma_api_marker_model_impl.dart';
import 'pleroma_api_marker_user_access_service.dart';

class PleromaApiMarkerUserAccessService extends PleromaApiService
    implements IPleromaApiMarkerUserAccessService {
  final MastodonApiMarkerUserAccessService mastodonApiMarkerUserAccessService;

  PleromaApiMarkerUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiMarkerUserAccessService = MastodonApiMarkerUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(restService: restService) {
    mastodonApiMarkerUserAccessService.disposeWith(this);
  }

  @override
  Future<Map<String, IPleromaApiMarker>> getMarkers({
    required List<String> timelines,
  }) =>
      restService.sendHttpRequestAndParse(
        request: mastodonApiMarkerUserAccessService.createGetMarkersRequest(
          timelines: timelines,
        ),
        requestFeature: getMarkersFeature,
        fieldFeatures: null,
        parser: _parseMarkerMap,
      );

  @override
  Future<Map<String, IPleromaApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  }) =>
      restService.sendHttpRequestAndParse(
        request: mastodonApiMarkerUserAccessService.createUpdateMarkersRequest(
          timelinesLastReadIds: timelinesLastReadIds,
        ),
        requestFeature: getMarkersFeature,
        fieldFeatures: null,
        parser: _parseMarkerMap,
      );

  @override
  IPleromaApiFeature get getMarkersFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMarkerUserAccessService.getMarkersFeature,
      );

  @override
  IPleromaApiFeature get updateMarkersFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMarkerUserAccessService.updateMarkersFeature,
      );
}

Map<String, IPleromaApiMarker> _parseMarkerMap(
  String jsonString,
) {
  var json = jsonDecode(jsonString) as Map<String, dynamic>;

  return json.map(
    (key, dynamic value) => MapEntry(
      key,
      PleromaApiMarker.fromJson(
        json,
      ),
    ),
  );
}
