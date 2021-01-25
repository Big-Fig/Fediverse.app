import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_exception.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
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

  @override
  final IPleromaRestService restService;

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
        relativePath: urlPath.join(
            pleromaAccountRelativeUrlPath, accountRemoteId, "favourites"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseStatusListResponse(httpResponse);
  }
}
