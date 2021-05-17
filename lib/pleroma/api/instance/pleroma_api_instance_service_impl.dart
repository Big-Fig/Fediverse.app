import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiInstanceService extends BasePleromaApiService
    implements IPleromaApiInstanceService {
  final instanceRelativeUrlPath = '/api/v1/instance';
  @override
  final IPleromaApiRestService restService;

  PleromaApiInstanceService({
    required this.restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IPleromaApiInstanceHistory>> getHistory() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          instanceRelativeUrlPath,
          'activity',
        ),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiInstanceHistory.fromJson,
    );
  }

  @override
  Future<IPleromaApiInstance> getInstance() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: instanceRelativeUrlPath,
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiInstance.fromJson,
    );
  }

  @override
  Future<List<String>> getPeers() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          instanceRelativeUrlPath,
          'peers',
        ),
      ),
    );

    return restService.processStringListResponse(
      httpResponse,
    );
  }
}
