import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';

abstract class IMastodonApiSuggestionsService implements IDisposable {
  // /api/v1/suggestions
  Future<List<IMastodonApiAccount>> getSuggestions({
    required int limit,
  });

  Future removeSuggestion({
    required String accountId,
  });
}
