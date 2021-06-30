import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';

abstract class IMastodonApiEndorsementsService implements IDisposable {
  // /api/v1/endorsements
  Future<List<IMastodonApiAccount>> getEndorsements({
    IMastodonApiPaginationRequest? pagination,
  });
}
