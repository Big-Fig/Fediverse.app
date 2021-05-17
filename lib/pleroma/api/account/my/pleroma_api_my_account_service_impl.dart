import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

var _logger = Logger('pleroma_api_my_account_service_impl.dart');

class PleromaApiMyAccountService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiMyAccountService {
  final verifyProfileRelativeUrlPath = '/api/v1/accounts/verify_credentials';
  final editProfileRelativeUrlPath = '/api/v1/accounts/update_credentials';
  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiMyAccountService({required this.restService})
      : super(
          restService: restService,
        );

  @override
  Future<IPleromaApiMyAccount> updateCredentials(
    IPleromaApiMyAccountEdit data,
  ) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.patch(
        relativePath: editProfileRelativeUrlPath,
        bodyJson: data.toJson(),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiMyAccount.fromJson,
    );
  }

  @override
  Future<IPleromaApiMyAccount> updateFiles(
    PleromaApiMyAccountFilesRequest accountFiles,
  ) async {
    _logger.finest(() => 'updateFiles $accountFiles');
    var httpResponse = await restService.uploadFileMultipartRequest(
      UploadMultipartRestRequest.patch(
        relativePath: editProfileRelativeUrlPath,
        files: {
          if (accountFiles.header != null) 'header': accountFiles.header!,
          if (accountFiles.avatar != null) 'avatar': accountFiles.avatar!,
          if (accountFiles.pleromaBackgroundImage != null)
            'pleroma_background_image': accountFiles.pleromaBackgroundImage!,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiMyAccount.fromJson,
    );
  }

  @override
  Future<IPleromaApiMyAccount> verifyCredentials() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(relativePath: verifyProfileRelativeUrlPath),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiMyAccount.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiStatus>> getBookmarks({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join('api/v1/bookmarks'),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiStatus>> getFavourites({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join('api/v1/favourites'),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiAccount>> getFollowRequests({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join('api/v1/follow_requests'),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> acceptFollowRequest({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          'api/v1/follow_requests',
          accountRemoteId,
          'authorize',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<IPleromaApiAccountRelationship> rejectFollowRequest({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          'api/v1/follow_requests',
          accountRemoteId,
          'reject',
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccountRelationship.fromJson,
    );
  }

  @override
  Future<List<String>> getDomainBlocks({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join('api/v1/domain_blocks'),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processStringListResponse(
      httpResponse,
    );
  }

  @override
  Future<List<IPleromaApiAccount>> getAccountBlocks({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join('api/v1/blocks'),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiAccount>> getAccountMutes({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join('api/v1/mutes'),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }
}
