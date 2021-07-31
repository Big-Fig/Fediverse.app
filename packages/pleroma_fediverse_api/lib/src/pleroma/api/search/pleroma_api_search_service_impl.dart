import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/search/pleroma_api_search_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/search/pleroma_api_search_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

class PleromaApiSearchService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiSearchService {
  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiSearchService({
    required this.restApiAuthService,
  }) : super(
          restService: restApiAuthService,
        );

  @override
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list, code-metrics
  Future<IPleromaApiSearchResult> search({
    required String query,
    String? accountId,
    bool? excludeUnreviewed,
    bool? following,
    bool? resolve,
    int? offset,
    MastodonApiSearchRequestType? type,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    if (pagination?.limit != null) {
      // ignore: no-magic-number
      assert(pagination!.limit! <= 40, 'Server-side limit');
    }

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: '/api/v2/search',
        queryArgs: [
          RestRequestQueryArg(
            key: 'q',
            value: query,
          ),
          if (type != null)
            RestRequestQueryArg(
              key: 'type',
              value: type.toJsonValue(),
            ),
          if (accountId != null)
            RestRequestQueryArg(
              key: 'account_id',
              value: accountId,
            ),
          if (excludeUnreviewed != null)
            RestRequestQueryArg(
              key: 'exclude_unreviewed',
              value: excludeUnreviewed.toString(),
            ),
          if (following != null)
            RestRequestQueryArg(
              key: 'following',
              value: following.toString(),
            ),
          if (resolve != null)
            RestRequestQueryArg(
              key: 'resolve',
              value: resolve.toString(),
            ),
          if (accountId != null)
            RestRequestQueryArg(
              key: 'account_id',
              value: accountId,
            ),
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiSearchResult.fromJson,
    );
  }
}
