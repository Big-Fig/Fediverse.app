import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/scheduled/pleroma_api_scheduled_status_exception.dart';
import 'package:fedi/pleroma/api/status/scheduled/pleroma_api_scheduled_status_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaApiScheduledStatusService extends DisposableOwner
    implements IPleromaApiScheduledStatusService {
  final scheduledStatusesRelativeUrlPath = "/api/v1/scheduled_statuses/";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiScheduledStatusService({required this.restService});

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

    return parseScheduledStatusResponse(httpResponse);
  }

  @override
  Future<bool> cancelScheduledStatus({
    required String scheduledStatusRemoteId,
  }) async {
    var request = RestRequest.delete(
      relativePath: join(
        scheduledStatusesRelativeUrlPath,
        scheduledStatusRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return httpResponse.statusCode == RestResponse.successResponseStatusCode;
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

    return parseScheduledStatusesResponse(httpResponse);
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
        "scheduled_at": scheduledAt,
      },
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseScheduledStatusResponse(httpResponse);
  }

  PleromaApiScheduledStatus parseScheduledStatusResponse(Response httpResponse) {
    RestResponse<PleromaApiScheduledStatus> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiScheduledStatus.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiScheduledStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<PleromaApiScheduledStatus> parseScheduledStatusesResponse(
    Response httpResponse,
  ) {
    RestResponse<List<PleromaApiScheduledStatus>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiScheduledStatus.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiScheduledStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
