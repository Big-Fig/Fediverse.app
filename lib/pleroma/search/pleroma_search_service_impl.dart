import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/search/mastodon_search_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/search/pleroma_search_exception.dart';
import 'package:fedi/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:fedi/rest/rest_request_model.dart';

class PleromaSearchService extends DisposableOwner
    implements IPleromaSearchService {
  @override
  final IPleromaAuthRestService restService;

  PleromaSearchService({required this.restService});

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  @override
  Future<IPleromaSearchResult> search({
    required String? query,
    String? accountId,
    bool? excludeUnreviewed,
    bool? following,
    bool? resolve,
    int? offset,
    MastodonSearchRequestType? type,
    IPleromaPaginationRequest? pagination,
  }) async {
    if (pagination?.limit != null) {
      assert(pagination!.limit! <= 40, "Server-side limit");
    }

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: "/api/v2/search",
        queryArgs: [
          RestRequestQueryArg("q", query),
          if (type != null)
            RestRequestQueryArg(
              "type",
              type.toJsonValue(),
            ),
          if (accountId != null)
            RestRequestQueryArg(
              "account_id",
              accountId,
            ),
          if (excludeUnreviewed != null)
            RestRequestQueryArg(
              "exclude_unreviewed",
              excludeUnreviewed.toString(),
            ),
          if (following != null)
            RestRequestQueryArg(
              "following",
              following.toString(),
            ),
          if (resolve != null)
            RestRequestQueryArg(
              "resolve",
              resolve.toString(),
            ),
          if (accountId != null)
            RestRequestQueryArg(
              "account_id",
              accountId,
            ),
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    if (httpResponse.statusCode == 200) {
      return PleromaSearchResult.fromJsonString(httpResponse.body);
    } else {
      throw PleromaSearchException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
