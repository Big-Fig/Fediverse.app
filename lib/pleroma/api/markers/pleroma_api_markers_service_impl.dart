import 'package:fedi/pleroma/api/markers/pleroma_api_markers_model.dart';
import 'package:fedi/pleroma/api/markers/pleroma_api_markers_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiMarkersService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiMarkersService {
  final markersRelativeUrlPath = '/api/v1/markers';

  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiMarkersService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<Map<String, IPleromaApiMarker>> getMarkers({
    required List<String> timelines,
  }) async {
    assert(timelines.isNotEmpty);

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          markersRelativeUrlPath,
        ),
        queryArgs: [
          RestRequestQueryArg(
            key: 'timeline[]',
            value: timelines
                .map(
                  (timeline) => '"$timeline"',
                )
                .join(','),
          ),
        ],
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      _parseMarkersMap,
    );
  }

  @override
  Future<Map<String, IPleromaApiMarker>> updateMarkers({
    required Map<String, String> timelinesLastReadIds,
  }) async {
    assert(timelinesLastReadIds.isNotEmpty);

    Map<String, String> bodyJson = {};

    timelinesLastReadIds.entries.forEach(
      (pair) {
        bodyJson['${pair.key}[last_read_id]'] = pair.value;
      },
    );

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          markersRelativeUrlPath,
        ),
        bodyJson: bodyJson,
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      _parseMarkersMap,
    );
  }
}

Map<String, IPleromaApiMarker> _parseMarkersMap(Map<String, dynamic> json) {
  return json as Map<String, IPleromaApiMarker>;
}
