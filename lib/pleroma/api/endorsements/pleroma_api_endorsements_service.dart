import 'package:fedi/mastodon/api/endorsements/mastodon_api_endorsements_service.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiEndorsementsService
    implements IMastodonApiEndorsementsService, IPleromaApi {
  static IPleromaApiEndorsementsService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiEndorsementsService>(
        context,
        listen: listen,
      );

  // /api/v1/endorsements
  @override
  Future<List<IPleromaApiAccount>> getEndorsements({
    IMastodonApiPaginationRequest? pagination,
  });
}
