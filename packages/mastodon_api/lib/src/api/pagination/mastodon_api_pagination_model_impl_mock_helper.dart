// ignore_for_file: no-magic-number
import 'mastodon_api_pagination_model_impl.dart';

class MastodonApiPaginationMockHelper {
  static MastodonApiPagination generate({
    required String seed,
  }) =>
      MastodonApiPagination(
        limit: seed.hashCode,
        maxId: seed + 'maxId',
        minId: seed + 'minId',
        sinceId: seed + 'sinceId',
      );
}
