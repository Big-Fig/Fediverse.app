import 'package:fedi/mastodon/api/suggestions/mastodon_api_suggestions_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';

abstract class IPleromaApiSuggestionsService
    implements IMastodonApiSuggestionsService {
  // /api/v1/suggestions
  @override
  Future<List<IPleromaApiAccount>> getSuggestions({
    required int limit,
  });
}
