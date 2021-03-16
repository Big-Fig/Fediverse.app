import 'package:fedi/mastodon/search/mastodon_search_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IPleromaSearchService implements IPleromaApi {
  static IPleromaSearchService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaSearchService>(context, listen: listen);

  Future<IPleromaSearchResult> search({
    required String? query,
    String? accountId,
    MastodonSearchRequestType? type,
    bool? excludeUnreviewed,
    bool? following,
    bool? resolve,
    int? offset,
    IPleromaPaginationRequest? pagination,
  });
}
