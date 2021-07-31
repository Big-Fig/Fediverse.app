import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiAccountService extends BasePleromaApiService
    implements IPleromaApiAccountService {
  final String accountRelativeUrlPath = '/api/v1/accounts/';
  final String pleromaAccountRelativeUrlPath = '/api/v1/pleroma/accounts/';

  PleromaApiAccountService({
    required IPleromaApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaApiAccount>> getAccountFollowings({
    required String? accountRemoteId,
    required bool withRelationship,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'following',
        ),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          if (withRelationship)
            RestRequestQueryArg(
              key: 'with_relationship',
              value: 'true',
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
  Future<IPleromaApiAccount> getAccount({
    required String accountRemoteId,
    required bool withRelationship,
  }) async {
    assert(accountRemoteId.isNotEmpty);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
        ),
        queryArgs: [
          if (withRelationship)
            RestRequestQueryArg(
              key: 'with_relationship',
              value: 'true',
            ),
        ],
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future<List<PleromaApiAccount>> getAccountFollowers({
    required String accountRemoteId,
    IPleromaApiPaginationRequest? pagination,
    required bool withRelationship,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          accountRelativeUrlPath,
          accountRemoteId,
          'followers',
        ),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          if (withRelationship)
            RestRequestQueryArg(
              key: 'with_relationship',
              value: 'true',
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
            _urlPath.join(accountRelativeUrlPath, accountRemoteId, 'statuses'),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
          RestRequestQueryArg(
            key: 'pinned',
            value: pinned?.toString(),
          ),
          RestRequestQueryArg(
            key: 'exclude_replies',
            value: excludeReplies?.toString(),
          ),
          RestRequestQueryArg(
            key: 'exclude_reblogs',
            value: excludeReblogs?.toString(),
          ),
          if (excludeVisibilities?.isNotEmpty == true)
            ...excludeVisibilities!.map(
              (excludeVisibility) => RestRequestQueryArg(
                key: 'exclude_visibilities[]',
                value: excludeVisibility.toString(),
              ),
            ),
          RestRequestQueryArg(
            key: 'with_muted',
            value: withMuted?.toString(),
          ),
          RestRequestQueryArg(
            key: 'only_media',
            value: onlyWithMedia?.toString(),
          ),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiStatus>> getAccountFavouritedStatuses({
    required String? accountRemoteId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          pleromaAccountRelativeUrlPath,
          accountRemoteId,
          'favourites',
        ),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }
}
