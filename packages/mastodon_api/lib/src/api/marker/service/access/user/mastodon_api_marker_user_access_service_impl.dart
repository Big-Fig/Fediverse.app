import 'dart:convert';

import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_marker_model.dart';
import '../../../mastodon_api_marker_model_impl.dart';
import 'mastodon_api_marker_user_access_service.dart';

class MastodonApiMarkerUserAccessService extends MastodonApiService
    implements IMastodonApiMarkerUserAccessService {
  static const markersRelativeUrlPath = '/api/v1/markers';

  MastodonApiMarkerUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<Map<String, IMastodonApiMarker>> getMarkers({
    required List<String> timelines,
  }) =>
      restService.sendHttpRequestAndParse(
        requestFeature: getMarkersFeature,
        fieldFeatures: null,
        request: createGetMarkersRequest(
          timelines: timelines,
        ),
        parser: _parseMarkerMap,
      );

  RestRequest createGetMarkersRequest({
    required List<String> timelines,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            markersRelativeUrlPath,
          ],
        ),
        queryArgs: [
          UrlQueryArg(
            key: 'timeline[]',
            value: timelines
                .map(
                  (timeline) => '"$timeline"',
                )
                .join(','),
          ),
        ],
      );

  @override
  Future<Map<String, IMastodonApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  }) =>
      restService.sendHttpRequestAndParse(
        requestFeature: updateMarkersFeature,
        fieldFeatures: null,
        request: createUpdateMarkersRequest(
          timelinesLastReadIds: timelinesLastReadIds,
        ),
        parser: _parseMarkerMap,
      );

  RestRequest createUpdateMarkersRequest({
    required Map<String, String> timelinesLastReadIds,
  }) {
    assert(timelinesLastReadIds.isNotEmpty, 'timelines should be not empty');

    var bodyJson = <String, String>{};

    for (final pair in timelinesLastReadIds.entries) {
      bodyJson['${pair.key}[last_read_id]'] = pair.value;
    }

    return RestRequest.post(
      relativePath: UrlPathHelper.join(
        [
          markersRelativeUrlPath,
        ],
      ),
      bodyJson: bodyJson,
    );
  }

  @override
  IMastodonApiFeature get getMarkersFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  IMastodonApiFeature get updateMarkersFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );
}

Map<String, IMastodonApiMarker> _parseMarkerMap(
  String jsonString,
) {
  var json = jsonDecode(jsonString) as Map<String, dynamic>;

  return json.map(
    (key, dynamic value) => MapEntry(
      key,
      MastodonApiMarker.fromJson(
        json,
      ),
    ),
  );
}
