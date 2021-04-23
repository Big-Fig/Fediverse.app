import 'package:fedi/mastodon/api/search/mastodon_api_search_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/search/pleroma_api_search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiSearchService implements IPleromaApi {
  static IPleromaApiSearchService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaApiSearchService>(context, listen: listen);

  Future<IPleromaApiSearchResult> search({
    required String? query,
    String? accountId,
    MastodonSearchRequestType? type,
    bool? excludeUnreviewed,
    bool? following,
    bool? resolve,
    int? offset,
    IPleromaApiPaginationRequest? pagination,
  });
}
