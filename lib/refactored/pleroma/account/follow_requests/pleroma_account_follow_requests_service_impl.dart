import 'package:fedi/refactored/pleroma/account/follow_requests/pleroma_account_follow_requests_exception.dart';
import 'package:fedi/refactored/pleroma/account/follow_requests/pleroma_account_follow_requests_service.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAccountFollowRequestsService
    implements IPleromaAccountFollowRequestsService {
  final accountFollowRequestsRelativeUrlPath = "/api/v1/follow_requests";
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

  PleromaAccountFollowRequestsService({@required this.restService});

  List<IPleromaAccount> parseAccountListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountFollowRequestsException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  IPleromaAccountRelationship parseAccountRelationshipResponse(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccountRelationship.fromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountFollowRequestsException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaAccountRelationship> acceptFollowRequestFrom(
      {@required String accountId}) async {
    assert(accountId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath: urlPath.join(
          accountFollowRequestsRelativeUrlPath, accountId, "authorize"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> rejectFollowRequestFrom(
      {@required String accountId}) async {
    assert(accountId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath: urlPath.join(
          accountFollowRequestsRelativeUrlPath, accountId, "reject"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> getPendingFollowRequests(
      {String sinceId, String minId, String maxId, int limit = 20}) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: urlPath.join(accountFollowRequestsRelativeUrlPath),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("min_id", minId),
          RestRequestQueryArg("limit", limit?.toString()),
        ]));

    return parseAccountListResponse(httpResponse);
  }

  @override
  void dispose() {
    // nothing
  }
}
