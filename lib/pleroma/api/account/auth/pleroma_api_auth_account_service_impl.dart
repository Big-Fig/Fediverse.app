import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_exception.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service_impl.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaApiAuthAccountService extends PleromaApiAccountService
    implements IPleromaApiAuthAccountService {
  final String accountReportRelativeUrlPath = "/api/v1/reports";

  final IPleromaApiAuthRestService authRestService;

  @override
  bool get isPleroma => authRestService.isPleroma;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      authRestService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiAuthAccountService({required this.authRestService})
      : super(
          restService: authRestService,
        );

  @override
  Future<List<IPleromaApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> remoteAccountIds,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(accountRelativeUrlPath, "relationships"),
        queryArgs: remoteAccountIds
            .map(
              (id) => RestRequestQueryArg("id[]", id),
            )
            .toList(),
      ),
    );

    return parseAccountRelationshipResponseList(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> blockAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "block",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> followAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "follow",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> muteAccount({
    required String? accountRemoteId,
    required bool? notifications,
    required int? expireDurationInSeconds,
  }) async {
    var bodyJson = <String, dynamic>{
      if (notifications != null) "notifications": notifications.toString(),
    };
    if (expireDurationInSeconds != null) {
      if (isPleroma) {
        bodyJson["expire_in"] = expireDurationInSeconds.toString();
      } else {
        bodyJson["duration"] = expireDurationInSeconds;
      }
    }
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "mute",
        ),
        bodyJson: bodyJson,
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> pinAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "pin",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> unBlockAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "unblock",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> unFollowAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "unfollow",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> unMuteAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "unmute",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> unPinAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "unpin",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<List<IPleromaApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "identity_proofs",
        ),
      ),
    );

    return parseAccountAccountIdentityProofList(httpResponse);
  }

  @override
  Future<List<IPleromaApiList>> getListsWithAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          "lists",
        ),
      ),
    );

    return parseListList(httpResponse);
  }

  @override
  Future<List<IPleromaApiAccount>> search({
    required String query,
    bool? resolve,
    bool? following,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(accountRelativeUrlPath, "search"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          RestRequestQueryArg("q", query),
          if (resolve != null)
            RestRequestQueryArg(
              "resolve",
              resolve.toString(),
            ),
          if (following != null)
            RestRequestQueryArg(
              "following",
              following.toString(),
            ),
        ],
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<bool> reportAccount({
    required IPleromaApiAccountReportRequest reportRequest,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: accountReportRelativeUrlPath,
        bodyJson: reportRequest.toJson(),
      ),
    );

    return httpResponse.statusCode == RestResponse.successResponseStatusCode;
  }

  @override
  Future blockDomain({
    required String domain,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join("api/v1/domain_blocks"),
        queryArgs: [
          RestRequestQueryArg(
            "domain",
            domain,
          ),
        ],
      ),
    );

    if (httpResponse.statusCode != RestResponse.successResponseStatusCode) {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future unBlockDomain({
    required String domain,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: urlPath.join("api/v1/domain_blocks"),
        queryArgs: [
          RestRequestQueryArg(
            "domain",
            domain,
          ),
        ],
      ),
    );

    if (httpResponse.statusCode != RestResponse.successResponseStatusCode) {
      throw PleromaApiAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<IPleromaApiAccountRelationship> subscribeAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          pleromaAccountRelativeUrlPath,
          accountRemoteId,
          "subscribe",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> unSubscribeAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          pleromaAccountRelativeUrlPath,
          accountRemoteId,
          "unsubscribe",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  bool get isMastodon => authRestService.isMastodon;
}
