import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';

abstract class IMastodonApiDirectoryService implements IDisposable {
  // /api/v1/directory
  Future<List<IMastodonApiAccount>> getDirectoryAccounts({
    IMastodonApiPaginationRequest? pagination,
  });
}
