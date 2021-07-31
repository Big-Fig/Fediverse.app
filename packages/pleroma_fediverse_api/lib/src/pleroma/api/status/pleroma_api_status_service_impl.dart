import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/context/pleroma_api_status_context_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart';

class PleromaApiStatusService extends BasePleromaApiService
    implements IPleromaApiStatusService {
  final statusRelativeUrlPath = '/api/v1/statuses/';

  PleromaApiStatusService({
    required IPleromaApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IPleromaApiStatus> getStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(statusRelativeUrlPath, statusRemoteId),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<PleromaApiStatusContext> getStatusContext({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        'context',
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatusContext.fromJson,
    );
  }
}
