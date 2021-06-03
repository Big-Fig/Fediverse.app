import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service_impl.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiAuthAccountService extends PleromaApiAccountService
    with PleromaApiAuthMixinService
    implements IPleromaApiAuthAccountService {
  final String accountReportRelativeUrlPath = '/api/v1/reports';

  final IPleromaApiAuthRestService authRestService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => authRestService;

  PleromaApiAuthAccountService({
    required this.authRestService,
  }) : super(
          restService: authRestService,
        );

  @override
  Future<List<IPleromaApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> remoteAccountIds,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(accountRelativeUrlPath, 'relationships'),
        queryArgs: remoteAccountIds
            .map(
              (id) => RestRequestQueryArg(key: 'id[]', value: id),
            )
            .toList(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> blockAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'block',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> followAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'follow',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> muteAccount({
    required String? accountRemoteId,
    required bool? notifications,
    required int? expireDurationInSeconds,
  }) async {
    var bodyJson = <String, dynamic>{
      if (notifications != null) 'notifications': notifications.toString(),
    };
    if (expireDurationInSeconds != null) {
      if (isPleroma) {
        bodyJson['expire_in'] = expireDurationInSeconds.toString();
      } else {
        bodyJson['duration'] = expireDurationInSeconds;
      }
    }
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'mute',
        ),
        bodyJson: bodyJson,
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> pinAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'pin',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> unBlockAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'unblock',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> unFollowAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'unfollow',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> unMuteAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'unmute',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> unPinAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'unpin',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'identity_proofs',
        ),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccountIdentityProof.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiList>> getListsWithAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'lists',
        ),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiList.fromJson,
    );
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
        relativePath: _urlPath.join(accountRelativeUrlPath, 'search'),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          RestRequestQueryArg(
            key: 'q',
            value: query,
          ),
          if (resolve != null)
            RestRequestQueryArg(
              key: 'resolve',
              value: resolve.toString(),
            ),
          if (following != null)
            RestRequestQueryArg(
              key: 'following',
              value: following.toString(),
            ),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future reportAccount({
    required IPleromaApiAccountReportRequest reportRequest,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: accountReportRelativeUrlPath,
        bodyJson: reportRequest.toJson(),
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future blockDomain({
    required String domain,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join('api/v1/domain_blocks'),
        queryArgs: [
          RestRequestQueryArg(
            key: 'domain',
            value: domain,
          ),
        ],
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future unBlockDomain({
    required String domain,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join('api/v1/domain_blocks'),
        queryArgs: [
          RestRequestQueryArg(
            key: 'domain',
            value: domain,
          ),
        ],
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future<IPleromaApiAccountRelationship> subscribeAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          pleromaAccountRelativeUrlPath,
          accountRemoteId,
          'subscribe',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> unSubscribeAccount({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          pleromaAccountRelativeUrlPath,
          accountRemoteId,
          'unsubscribe',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }
}
