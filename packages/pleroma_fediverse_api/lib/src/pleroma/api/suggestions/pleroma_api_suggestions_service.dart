import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiSuggestionsService
    implements IMastodonApiSuggestionsService, IPleromaApi {
  // /api/v1/suggestions
  @override
  Future<List<IPleromaApiAccount>> getSuggestions({
    required int? limit,
  });
}
