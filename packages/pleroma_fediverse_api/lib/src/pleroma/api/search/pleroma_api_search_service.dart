import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/search/pleroma_api_search_model.dart';

abstract class IPleromaApiSearchService implements IPleromaApi {
  Future<IPleromaApiSearchResult> search({
    required String query,
    String? accountId,
    MastodonApiSearchRequestType? type,
    bool? excludeUnreviewed,
    bool? following,
    bool? resolve,
    int? offset,
    IPleromaApiPaginationRequest? pagination,
  });
}
