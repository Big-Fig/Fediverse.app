import 'package:fedi/mastodon/api/endorsements/mastodon_api_endorsements_service.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';

abstract class IPleromaApiEndorsementsService
    implements IMastodonApiEndorsementsService {
  // /api/v1/endorsements
  @override
  Future<List<IPleromaApiAccount>> getEndorsements({
    IMastodonApiPaginationRequest? pagination,
  });
}
