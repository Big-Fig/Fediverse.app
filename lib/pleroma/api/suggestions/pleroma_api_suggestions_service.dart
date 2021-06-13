import 'package:fedi/mastodon/api/suggestions/mastodon_api_suggestions_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiSuggestionsService
    implements IMastodonApiSuggestionsService, IPleromaApi {
  static IPleromaApiSuggestionsService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiSuggestionsService>(
        context,
        listen: listen,
      );

  // /api/v1/suggestions
  @override
  Future<List<IPleromaApiAccount>> getSuggestions({
    required int? limit,
  });
}
