import 'package:fedi/pleroma/api/account/auth/pleroma_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_exception.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_service_impl.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAuthAccountService extends PleromaAccountService
    implements IPleromaAuthAccountService {
  final String accountReportRelativeUrlPath = "/api/v1/reports";

  final IPleromaAuthRestService authRestService;

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

  PleromaAuthAccountService({required this.authRestService})
      : super(
          restService: authRestService,
        );

  @override
  Future<List<IPleromaAccountRelationship>> getRelationshipWithAccounts({
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
  Future<IPleromaAccountRelationship> blockAccount({
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
  Future<IPleromaAccountRelationship> followAccount({
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
  Future<IPleromaAccountRelationship> muteAccount({
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
  Future<IPleromaAccountRelationship> pinAccount({
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
  Future<IPleromaAccountRelationship> unBlockAccount({
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
  Future<IPleromaAccountRelationship> unFollowAccount({
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
  Future<IPleromaAccountRelationship> unMuteAccount({
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
  Future<IPleromaAccountRelationship> unPinAccount({
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
  Future<List<IPleromaAccountIdentityProof>> getAccountIdentifyProofs({
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
  Future<List<IPleromaList>> getListsWithAccount({
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
  Future<List<IPleromaAccount>> search({
    required String query,
    bool? resolve,
    bool? following,
    IPleromaPaginationRequest? pagination,
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
    required IPleromaAccountReportRequest reportRequest,
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
      throw PleromaAccountException(
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
      throw PleromaAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<IPleromaAccountRelationship> subscribeAccount({
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
  Future<IPleromaAccountRelationship> unSubscribeAccount({
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
