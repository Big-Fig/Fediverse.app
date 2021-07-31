import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/pagination/mastodon_api_pagination_model.dart';

abstract class IMastodonApiEndorsementsService implements IDisposable {
  // /api/v1/endorsements
  Future<List<IMastodonApiAccount>> getEndorsements({
    IMastodonApiPaginationRequest? pagination,
  });
}
