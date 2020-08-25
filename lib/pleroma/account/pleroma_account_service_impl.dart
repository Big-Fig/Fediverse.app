import 'package:fedi/pleroma/account/pleroma_account_exception.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAccountService implements IPleromaAccountService {
  final accountRelativeUrlPath = "/api/v1/accounts/";
  final accountReportRelativeUrlPath = "/api/v1/reports";
  @override
  final IPleromaAuthRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

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

  PleromaAccountService({@required this.restService});

  List<IPleromaAccount> parseAccountListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaAccountIdentityProof> parseAccountAccountIdentityProofList(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccountIdentityProof.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaList> parseListList(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaList.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaStatus> parseStatusListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaStatus.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  IPleromaAccountRelationship parseAccountRelationshipResponse(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccountRelationship.fromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaAccountRelationship> parseAccountRelationshipResponseList(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccountRelationship.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaAccountRelationship>> getRelationshipWithAccounts(
      {@required List<String> remoteAccountIds}) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: urlPath.join(accountRelativeUrlPath, "relationships"),
        queryArgs: remoteAccountIds
            .map((id) => RestRequestQueryArg("id", id))
            .toList()));

    return parseAccountRelationshipResponseList(httpResponse);
  }

  IPleromaAccount parseAccountResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.fromJsonString(httpResponse.body);
    } else {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaAccount>> getAccountFollowings(
      {@required String accountRemoteId,
      String sinceId,
      String maxId,
      int limit = 20}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "following"),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("limit", limit?.toString()),
        ]));

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> blockAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "block"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> followAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "follow"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> muteAccount(
      {@required String accountRemoteId, bool notifications}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "mute"),
        bodyJson: {"notifications": notifications.toString()}));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> pinAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "pin"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unBlockAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "unblock"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unFollowAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "unfollow"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unMuteAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "unmute"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unPinAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "unpin"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccount> getAccount({@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
      relativePath: urlPath.join(accountRelativeUrlPath, accountRemoteId),
    ));

    return parseAccountResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> getAccountFollowers(
      {@required String accountRemoteId,
      String sinceId,
      String maxId,
      int limit = 20}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "followers"),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("limit", limit?.toString()),
        ]));

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccountIdentityProof>> getAccountIdentifyProofs(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
      relativePath: urlPath.join(
          accountRelativeUrlPath, accountRemoteId, "identity_proofs"),
    ));

    return parseAccountAccountIdentityProofList(httpResponse);
  }

  @override
  Future<List<IPleromaList>> getListsWithAccount(
      {@required String accountRemoteId}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "lists"),
    ));

    return parseListList(httpResponse);
  }

  @override
  Future<List<IPleromaStatus>> getAccountStatuses(
      {@required String accountRemoteId,
      String tagged,
      bool pinned,
      bool excludeReplies,
      bool excludeReblogs,
      List<String> excludeVisibilities,
      bool withMuted,
      bool onlyMedia,
      String sinceId,
      String maxId,
      int limit = 20}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "statuses"),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("limit", limit?.toString()),
          RestRequestQueryArg("pinned", pinned?.toString()),
          RestRequestQueryArg("exclude_replies", excludeReplies?.toString()),
          RestRequestQueryArg("exclude_reblogs", excludeReblogs?.toString()),
          if (excludeVisibilities?.isNotEmpty == true)
            ...excludeVisibilities.map(
              (excludeVisibility) => RestRequestQueryArg(
                "exclude_visibilities[]",
                excludeVisibility?.toString(),
              ),
            ),
          RestRequestQueryArg("with_muted", withMuted?.toString()),
          RestRequestQueryArg("only_media", onlyMedia?.toString()),
        ]));

    return parseStatusListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> search(
      {@required String query,
      bool resolve,
      bool following,
      int limit = 20}) async {
    assert(query?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: urlPath.join(accountRelativeUrlPath, "search"),
        queryArgs: [
          RestRequestQueryArg("q", query),
          RestRequestQueryArg("resolve", resolve?.toString()),
          RestRequestQueryArg("following", following?.toString()),
          RestRequestQueryArg("limit", limit?.toString()),
        ]));

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<bool> reportAccount(
      {IPleromaAccountReportRequest reportRequest}) async {
    assert(reportRequest?.accountId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
        relativePath: urlPath.join(accountReportRelativeUrlPath),
        bodyJson: reportRequest.toJson()));

    return httpResponse.statusCode == 200;
  }

  @override
  void dispose() {
    // nothing
  }
}
