import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_exception.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaApiAccountService extends DisposableOwner
    implements IPleromaApiAccountService {
  final String accountRelativeUrlPath = "/api/v1/accounts/";
  final String pleromaAccountRelativeUrlPath = "/api/v1/pleroma/accounts/";

  @override
  final IPleromaApiRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiAccountService({
    required this.restService,
  });

  List<PleromaApiAccount> parseAccountListResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiAccount.listFromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiAccountIdentityProof> parseAccountAccountIdentityProofList(
    Response httpResponse,
  ) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiAccountIdentityProof.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiList> parseListList(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiList.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiStatus> parseStatusListResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiStatus.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  IPleromaApiAccountRelationship parseAccountRelationshipResponse(
    Response httpResponse,
  ) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiAccountRelationship.fromJsonString(httpResponse.body);
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiAccountRelationship> parseAccountRelationshipResponseList(
    Response httpResponse,
  ) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiAccountRelationship.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  IPleromaApiAccount parseAccountResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiAccount.fromJsonString(httpResponse.body);
    } else {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<List<IPleromaApiAccount>> getAccountFollowings({
    required String? accountRemoteId,
    IPleromaApiPaginationRequest? pagination,
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
  Future<IPleromaApiAccount> getAccount({
    required String? accountRemoteId,
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
  Future<List<PleromaApiAccount>> getAccountFollowers({
    required String accountRemoteId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
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
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  Future<List<IPleromaApiStatus>> getAccountStatuses({
    required String accountRemoteId,
    String? tagged,
    bool? pinned,
    bool? excludeReplies,
    bool? excludeReblogs,
    List<String>? excludeVisibilities,
    bool? withMuted,
    bool? onlyWithMedia,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "statuses"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          RestRequestQueryArg("pinned", pinned?.toString()),
          RestRequestQueryArg("exclude_replies", excludeReplies?.toString()),
          RestRequestQueryArg("exclude_reblogs", excludeReblogs?.toString()),
          if (excludeVisibilities?.isNotEmpty == true)
            ...excludeVisibilities!.map(
              (excludeVisibility) => RestRequestQueryArg(
                "exclude_visibilities[]",
                excludeVisibility.toString(),
              ),
            ),
          RestRequestQueryArg("with_muted", withMuted?.toString()),
          RestRequestQueryArg("only_media", onlyWithMedia?.toString()),
        ],
      ),
    );

    return parseStatusListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaApiStatus>> getAccountFavouritedStatuses({
    required String? accountRemoteId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          pleromaAccountRelativeUrlPath,
          accountRemoteId,
          "favourites",
        ),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseStatusListResponse(httpResponse);
  }
}
