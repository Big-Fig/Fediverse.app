import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/scheduled/pleroma_api_scheduled_status_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart';

class PleromaApiScheduledStatusService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiScheduledStatusService {
  final scheduledStatusesRelativeUrlPath = '/api/v1/scheduled_statuses/';

  final IPleromaApiAuthRestService authRestService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => authRestService;

  PleromaApiScheduledStatusService({
    required this.authRestService,
  }) : super(
          restService: authRestService,
        );

  @override
  Future<IPleromaApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        scheduledStatusesRelativeUrlPath,
        scheduledStatusRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiScheduledStatus.fromJson,
    );
  }

  @override
  Future<void> cancelScheduledStatus({
    required String scheduledStatusRemoteId,
  }) async {
    var request = RestRequest.delete(
      relativePath: join(
        scheduledStatusesRelativeUrlPath,
        scheduledStatusRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    restService.processEmptyResponse(httpResponse);
  }

  @override
  Future<List<IPleromaApiScheduledStatus>> getScheduledStatuses({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var request = RestRequest.get(
      relativePath: scheduledStatusesRelativeUrlPath,
      queryArgs: pagination?.toQueryArgs(),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiScheduledStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusRemoteId,
    required DateTime scheduledAt,
  }) async {
    var request = RestRequest.put(
      relativePath: join(
        scheduledStatusesRelativeUrlPath,
        scheduledStatusRemoteId,
      ),
      bodyJson: {
        'scheduled_at': scheduledAt,
      },
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiScheduledStatus.fromJson,
    );
  }
}
