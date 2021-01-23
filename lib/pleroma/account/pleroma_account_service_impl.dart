import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_exception.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAccountService extends DisposableOwner
    implements IPleromaAccountService {
  final String accountRelativeUrlPath = "/api/v1/accounts/";
  final String pleromaAccountRelativeUrlPath = "/api/v1/pleroma/accounts/";
  final String accountReportRelativeUrlPath = "/api/v1/reports";
  @override
  final IPleromaAuthRestService restService;


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
  Future<List<IPleromaAccount>> getAccountFollowings({
    @required String accountRemoteId,
    IPleromaPaginationRequest pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "following"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> blockAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "block"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> followAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(accountRelativeUrlPath, accountRemoteId, "follow"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> muteAccount({
    @required String accountRemoteId,
    @required bool notifications,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "mute"),
        bodyJson: {
          "notifications": notifications.toString(),
        },
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> pinAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "pin"),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unBlockAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "unblock"),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unFollowAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "unfollow"),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unMuteAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "unmute"),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unPinAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "unpin"),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccount> getAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(accountRelativeUrlPath, accountRemoteId),
      ),
    );

    return parseAccountResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> getAccountFollowers({
    @required String accountRemoteId,
    IPleromaPaginationRequest pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "followers"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccountIdentityProof>> getAccountIdentifyProofs({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
      relativePath: urlPath.join(
          accountRelativeUrlPath, accountRemoteId, "identity_proofs"),
    ));

    return parseAccountAccountIdentityProofList(httpResponse);
  }

  @override
  Future<List<IPleromaList>> getListsWithAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "lists"),
      ),
    );

    return parseListList(httpResponse);
  }

  @override
  Future<List<IPleromaStatus>> getAccountStatuses({
    @required String accountRemoteId,
    String tagged,
    bool pinned,
    bool excludeReplies,
    bool excludeReblogs,
    List<String> excludeVisibilities,
    bool withMuted,
    bool onlyWithMedia,
    IPleromaPaginationRequest pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "statuses"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
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
          RestRequestQueryArg("only_media", onlyWithMedia?.toString()),
        ]));

    return parseStatusListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaStatus>> getAccountFavouritedStatuses({
    @required String accountRemoteId,
    IPleromaPaginationRequest pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            urlPath.join(pleromaAccountRelativeUrlPath, accountRemoteId, "favourites"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseStatusListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> search({
    @required String query,
    bool resolve,
    bool following,
    IPleromaPaginationRequest pagination,
  }) async {
    assert(query?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(accountRelativeUrlPath, "search"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          RestRequestQueryArg("q", query),
          if (resolve != null)
            RestRequestQueryArg("resolve", resolve?.toString()),
          if (following != null)
            RestRequestQueryArg("following", following?.toString()),
        ],
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<bool> reportAccount({
    IPleromaAccountReportRequest reportRequest,
  }) async {
    assert(reportRequest?.accountId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(accountReportRelativeUrlPath),
        bodyJson: reportRequest.toJson(),
      ),
    );

    return httpResponse.statusCode == 200;
  }

  @override
  Future blockDomain({
    @required String domain,
  }) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath: urlPath.join("api/v1/domain_blocks"),
      queryArgs: [
        RestRequestQueryArg("domain", domain),
      ],
    ));

    if (httpResponse.statusCode != 200) {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future unBlockDomain({
    @required String domain,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: urlPath.join("api/v1/domain_blocks"),
        queryArgs: [
          RestRequestQueryArg("domain", domain),
        ],
      ),
    );

    if (httpResponse.statusCode != 200) {
      throw PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaAccountRelationship> subscribeAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath: urlPath.join(
          pleromaAccountRelativeUrlPath, accountRemoteId, "subscribe"),
    ));

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> unSubscribeAccount({
    @required String accountRemoteId,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
            pleromaAccountRelativeUrlPath, accountRemoteId, "unsubscribe"),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }
}
