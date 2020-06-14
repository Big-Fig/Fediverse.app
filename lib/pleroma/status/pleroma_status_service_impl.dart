import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/context/pleroma_status_context_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_exception.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaStatusService implements IPleromaStatusService {
  final statusRelativeUrlPath = "/api/v1/statuses/";
  @override
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaStatusService({@required this.restService});

  @override
  void dispose() {
    // nothing
  }

  @override
  Future<IPleromaStatus> getStatus({@required String statusRemoteId}) async {
    var request = RestRequest.get(
        relativePath: join(statusRelativeUrlPath, statusRemoteId));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> deleteStatus({@required String statusRemoteId}) async {
    var request = RestRequest.delete(
        relativePath: join(statusRelativeUrlPath, statusRemoteId));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> muteStatus({@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "mute"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unMuteStatus({@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "unmute"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> pinStatus({@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "pin"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unPinStatus({@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "unpin"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  PleromaStatus parseStatusResponse(Response httpResponse) {
    RestResponse<PleromaStatus> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatus.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  PleromaScheduledStatus parseScheduledStatusResponse(Response httpResponse) {
    RestResponse<PleromaScheduledStatus> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaScheduledStatus.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  PleromaStatusContext parseStatusContextResponse(Response httpResponse) {
    RestResponse<PleromaStatusContext> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaStatusContext.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<PleromaAccount> parseAccountsResponse(Response httpResponse) {
    RestResponse<List<PleromaAccount>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaAccount.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaAccount>> favouritedBy({
    @required String statusRemoteId,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) async {
    var request = RestRequest.get(
        queryArgs: [
          RestRequestQueryArg("min_id", minId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("limit", limit.toString()),
        ],
        relativePath:
            join(statusRelativeUrlPath, statusRemoteId, "favourited_by"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseAccountsResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> reblogedBy({
    @required String statusRemoteId,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) async {
    var request = RestRequest.get(
        queryArgs: [
          RestRequestQueryArg("min_id", minId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("limit", limit.toString()),
        ],
        relativePath:
            join(statusRelativeUrlPath, statusRemoteId, "rebloged_by"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseAccountsResponse(httpResponse);
  }

  @override
  Future<PleromaStatusContext> getStatusContext(
      {@required String statusRemoteId}) async {
    var request = RestRequest.get(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "context"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusContextResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> reblogStatus({@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "reblog"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unReblogStatus(
      {@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "unreblog"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> favouriteStatus(
      {@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "favourite"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unFavouriteStatus(
      {@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(
            statusRelativeUrlPath,
            statusRemoteId,
            "unfavourite"
            ""));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> bookmarkStatus(
      {@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(statusRelativeUrlPath, statusRemoteId, "bookmark"));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unBookmarkStatus(
      {@required String statusRemoteId}) async {
    var request = RestRequest.post(
        relativePath: join(
            statusRelativeUrlPath,
            statusRemoteId,
            "unbookmark"
            ""));
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> postStatus({@required IPleromaPostStatus data}) async {
    var json = data.toJson();

    var request =
        RestRequest.post(relativePath: statusRelativeUrlPath, bodyJson: json);

    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaScheduledStatus> scheduleStatus(
      {IPleromaScheduleStatus data}) async {
    var json = data.toJson();

    assert(data.scheduledAt != null);
    var request =
        RestRequest.post(relativePath: statusRelativeUrlPath, bodyJson: json);

    var httpResponse = await restService.sendHttpRequest(request);

    return parseScheduledStatusResponse(httpResponse);
  }
}
