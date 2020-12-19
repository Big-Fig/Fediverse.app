import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_exception.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaScheduledStatusService extends DisposableOwner
    implements IPleromaScheduledStatusService {
  final scheduledStatusesRelativeUrlPath = "/api/v1/scheduled_statuses/";
  @override
  final IPleromaAuthRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaScheduledStatusService({@required this.restService});

  @override
  Future<IPleromaScheduledStatus> getScheduledStatus({
    @required String scheduledStatusRemoteId,
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
    @required String scheduledStatusRemoteId,
  }) async {
    var request = RestRequest.delete(
      relativePath: join(
        scheduledStatusesRelativeUrlPath,
        scheduledStatusRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return httpResponse.statusCode == 200;
  }

  @override
  Future<List<IPleromaScheduledStatus>> getScheduledStatuses({
    IPleromaPaginationRequest pagination,
  }) async {
    var request = RestRequest.get(
      relativePath: scheduledStatusesRelativeUrlPath,
      queryArgs: pagination?.toQueryArgs(),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseScheduledStatusesResponse(httpResponse);
  }

  @override
  Future<IPleromaScheduledStatus> reScheduleStatus(
      {@required String scheduledStatusRemoteId,
      @required DateTime scheduledAt}) async {
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

  PleromaScheduledStatus parseScheduledStatusResponse(Response httpResponse) {
    RestResponse<PleromaScheduledStatus> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaScheduledStatus.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaScheduledStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<PleromaScheduledStatus> parseScheduledStatusesResponse(
      Response httpResponse) {
    RestResponse<List<PleromaScheduledStatus>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaScheduledStatus.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaScheduledStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
